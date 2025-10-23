--[[
	Custom Text Input
	Author: MadShadow

	Example:
	local widgetInfo = 
	{
		Widget = "XYZ", -- name of the button that receives the output updates
		Before = "@center ",
		NumbersOnly=true,
		MaxLength=3,
		Callback=EMS.GL.CustomTextInputCallback,
		..,
		... see below for all customizable options.
	}
	
	ctiObject = CTI.New(widgetInfo)
]]


CTI = {
	Groups={},
	CursorVisible = false,
	Replacements = {
		[223] = "\195\159", -- ß
		[252] = "\195\188", -- ü
		[220] = "\195\156", -- Ü
		[246] = "\195\182", -- ö
		[214] = "\195\150", -- Ö
		[228] = "\195\164", -- ä
		[196] = "\195\132", -- Ä
	},
	-- special characters need two backspaces
	BackspaceTwo = 
	{
		[159] = true, -- ß
		[188] = true, -- ü
		[156] = true, -- Ü
		[182] = true, -- ö
		[150] = true, -- Ö
		[164] = true, -- ä
		[132] = true, -- Ä
	},
};

function CTI.New(_data)
	--if true then return  end
	--assert(S5Hook, "S5Hook not found!");
	assert(CTI, "CharTriggerHandle not found!");
	--assert(metatable, "metatable-fix not found!");
	local cti = {
		Widget = _data.Widget or 0,
		Callback = _data.Callback or function()end,
		KeyPressedCallback = _data.KeyPressedCallback or function()end,
		OpenCallback = _data.OpenCallback or function() end,
		MaxLength = _data.MaxLength or 1000,
		NumbersOnly = _data.NumbersOnly or false,
		AllowNegativeNumbers = _data.AllowNegativeNumbers or false,
		AllowFloatingPointNumbers = _data.AllowFloatingPointNumbers or false,
		EditMode = _data.EditMode or false,
		CursorChar = _data.CursorChar or "|",
		Before = _data.Before or "",
		After = _data.After or "",
		ForceInput = _data.ForceInput or false,
		ResetInput = _data.ResetInput or false,
		HideAfterInputDone = _data.HideAfterInputDone or false,
		CanBeLeftEmpty = _data.CanBeLeftEmpty or false,
		HideMouse = _data.HideMouse or false,
		NoVideoMode = _data.NoVideoMode or false,
		MultipleWhiteSpaces = _data.MultipleWhiteSpaces or false,
		IsOpen = false,
		
		-- intern values
		Text = "",
		LastInput = -1,
		Backup = "",
	};
	local wId=cti.Widget;
	if type(cti.Widget)=="string" then
		wId = XGUIEng.GetWidgetID(cti.Widget);
	end
	assert(wId~=0, "CustomTextInput: Your widget is invalid!(widget:"..tostring(cti.Widget)..")");
	setmetatable(cti, {__index=CTI});
	return cti;
end

function CTI:Open()
	if CTI.Active then
		if CTI.Active.ForceInput then
			return;
		end
		if string.len(CTI.Active.Text) == 0 then
			CTI.Active:ResetAndClose(true);
		else
			CTI.Active:Close(true);
		end
	end
	if not CTI.CharTriggerId then
		CTI.CharTriggerId = CTH.RegisterCT(CTI.CharTrigger);
	end
	if not CTI.CursorControlJob then
		CTI.CursorControlJob = StartSimpleHiResJob("CTI_CursorControl");
	end

	CTI.Active = self;
	
	self.Backup = XGUIEng.GetText(self.Widget);
	if self.EditMode then
		self.Text = self.Backup;
	else
		self.Text = "";
	end
	
	self.IsOpen = true;
	self:OpenCallback();
	
	XGUIEng.ShowWidget(self.Widget, 1);
	if not self.NoVideoMode then
		Input.VideoMode();
	end
	if self.HideMouse then
		GUI.ActivateCutSceneState();
	end
end

function CTI:Close(_keepCharTrigger, _noChange)
	if not _keepCharTrigger then
		CTH.RemoveCT(CTI.CharTriggerId);
		CTI.CharTriggerId = nil;
		EndJob(CTI.CursorControlJob);
		CTI.CursorControlJob = nil;
	end
	if self.HideAfterInputDone then
		XGUIEng.ShowWidget(self.Widget,0);
	end
	self.IsOpen = false;
	self.Callback(self.Text, _noChange, self.Widget);
	CTI.Active = nil;
	Input.GameMode();
	GUI.ActivateSelectionState();
end

function CTI:ResetAndClose(_keepCharTrigger)
	XGUIEng.SetText(self.Widget, self.Backup);
	self.Text = self.Backup;
	self:Close(_keepCharTrigger or false, true);
end

function CTI:IsVisible()
	local widgetId = self.Widget;
	while(XGUIEng.IsWidgetShown(widgetId) == 1) do
		widgetId = XGUIEng.GetWidgetsMotherID(widgetId);
	end
	if widgetId == 0 then
		return true;
	end
	return false;
end

function CTI:GetInput()
	return self.Text;
end

CTIGroup = {};
function CTIGroup.New()
	local grp = {IsGroup=true, CTIs={}};
	setmetatable(grp, {__index=CTIGroup});
	return grp;
end

function CTIGroup:Add(_cti, _index)
	_cti.Group = self;
	if _index then
		table.insert(self.CTIs, _index, _cti);
	else
		table.insert(self.CTIs, _cti);
	end
end

function CTIGroup:Delete(_ctiOrIndex)
	if type(_ctiOrIndex) == "number" then
		table.remove(self.CTIs, _ctiOrIndex);
	else
		for i = 1, table.getn(self.CTIs) do
			if self.CTIs[i] == _ctiOrIndex then
				table.remove(self.CTIs, i);
				return;
			end
		end
	end
end

function CTIGroup:Next(_current)
	if not self.IsGroup then
		return;
	end
	local nextCTI;
	for i = 1, table.getn(self.CTIs) do
		if self.CTIs[i] == _current then
			if (i+1) > table.getn(self.CTIs) then
				nextCTI = self.CTIs[1];
			else
				nextCTI = self.CTIs[i+1];
			end
			break;
		end
	end
	if string.len(_current.Text) == 0 then
		XGUIEng.SetText(_current.Widget, _current.Backup);
	else
		XGUIEng.SetText(_current.Widget, _current.Before .. _current.Text .. _current.After);
	end
	_current:Close();
	nextCTI:Open();
end

function CTI.CharTrigger(charAsNum)
	CTI.Active.KeyPressedCallback(charAsNum);
	if charAsNum == 27 and not CTI.Active.ForceInput then
		-- escape
		CTI.Active:ResetAndClose();
		return;
	elseif charAsNum == 13 then
		-- enter
		if not CTI.Active.CanBeLeftEmpty then
			if CTI.Active.ForceInput then
				return;
			end
			if string.len(CTI.Active.Text) == 0 then
				-- empty => reset
				CTI.Active:ResetAndClose();
				return;
			end
			-- check for valid numbers
			if CTI.Active.NumbersOnly and tonumber(CTI.Active.Text) == nil then
				CTI.Active:ResetAndClose();
				return;
			end
		end
		XGUIEng.SetText(CTI.Active.Widget, CTI.Active.Before .. CTI.Active.Text .. CTI.Active.After);
		CTI.Active:Close();
		return;
	elseif charAsNum == 9 then
		-- tab
		if CTI.Active.Group then
			CTI.Active.Group:Next(CTI.Active);
		end
		return;
	elseif charAsNum == 8 then
		-- backspace
		local strlen = string.len(CTI.Active.Text);
		local currentChar = string.sub(CTI.Active.Text, strlen, strlen);	
		if strlen <= 0 then
			return;
		elseif CTI.BackspaceTwo[string.byte(currentChar)] then
			CTI.Active.Text = string.sub(CTI.Active.Text, 1, strlen-2);
		else
			CTI.Active.Text = string.sub(CTI.Active.Text, 1, strlen-1);
		end
	elseif string.len(CTI.Active.Text) >= CTI.Active.MaxLength then
		return;
	elseif CTI.Active.NumbersOnly then
		local num = charAsNum - 48;

		if CTI.Active.AllowFloatingPointNumbers
		and (charAsNum == string.byte(".") or charAsNum == string.byte(",")) then
			-- only append one .
			if not string.find(CTI.Active.Text, ".", 1, true) then
				CTI.Active.Text = CTI.Active.Text .. ".";
			end
		end
		if CTI.Active.AllowNegativeNumbers
		and (charAsNum == string.byte("-")) then
			-- only append a minus, if its the first character.
			if string.len(CTI.Active.Text) <= 0 then
				CTI.Active.Text = CTI.Active.Text .. "-";
			end
		end
		if num < 0 or num > 9 then
			return;
		end
		CTI.Active.Text = CTI.Active.Text .. num;
	else
		if not CTI.Active.MultipleWhiteSpaces then
			if CTI.Active.LastInput == 32 and charAsNum == 32 then
				-- * deny multiple whitespaces * --
				return;
			end
		end
		CTI.Active.LastInput = charAsNum;
		
		if CTI.Replacements[charAsNum] then
			CTI.Active.Text = CTI.Active.Text .. CTI.Replacements[charAsNum];
		else
			CTI.Active.Text = CTI.Active.Text .. string.char(charAsNum);
		end
	end
	CTI.CursorVisible = true;
	XGUIEng.SetText(CTI.Active.Widget, CTI.Active.Before .. CTI.Active.Text .. CTI.Active.CursorChar .. CTI.Active.After);
end

function CTI_CursorControl()
	if Counter.Tick2("CTI_CursorControl", 5) then
		if not CTI.Active:IsVisible() then
			CTI.Active:ResetAndClose();
			return;
		end
		if CTI.CursorVisible then
			CTI.CursorVisible = false;
			XGUIEng.SetText(CTI.Active.Widget, CTI.Active.Before .. CTI.Active.Text .. CTI.Active.After);
		else
			CTI.CursorVisible = true;
			XGUIEng.SetText(CTI.Active.Widget, CTI.Active.Before .. CTI.Active.Text .. CTI.Active.CursorChar .. CTI.Active.After);
		end
	end
end