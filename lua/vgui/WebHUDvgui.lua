local PANEL = {}
function PANEL:Init()

	self:Dock( FILL )

	self.HTML = vgui.Create( "DHTML", self )

	self.HTML:Dock( FILL )
	self.HTML:OpenURL( "asset://garrysmod/html/WebHUD/index.html" )
	self.HTML:SetAllowLua( true )

	self:SetPopupStayAtBack( true )
end

function PANEL:Call( js )
	self.HTML:QueueJavascript( js )
end

vgui.Register( "WebHUD", PANEL, "EditablePanel" )