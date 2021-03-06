"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", function () { return console.log("Control+Enter was pressed"); });
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
    //add custom config here, such as
    "ui.colorscheme": "dracula",
    "oni.useDefaultConfig": false,
    //"oni.bookmarks": ["~/Documents"],
    "oni.loadInitVim": true,
    "editor.fontSize": "14px",
    "editor.fontFamily": "Source Code Pro for Powerline",
    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "sidebar.enabled": false,
    "editor.fullScreenOnStart": true,
    "editor.scrollBar.visible": false,
    "statusbar.enabled": false,
    "workspace.defaultWorkspace": "/Users/joao/workspace",
    "debug.neovimPath": "/usr/local/bin/nvim"
};
