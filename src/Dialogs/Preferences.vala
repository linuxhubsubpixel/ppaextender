/*
* Copyright (c) 2019 Mirko Brombin <send@mirko.pm>
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Mirko Brombin <https://linuxhub.it>
*/

public class PPAExtender.Dialogs.Preferences : Hdy.PreferencesWindow
{
    private Gtk.CssProvider css_provider = new Gtk.CssProvider ();
    private MainWindow mainWindow;

    public string source { get; construct set; }

    public Preferences(MainWindow mainWindow)
    {
        Object (
            modal: true,
            title: _("Preferences"),
            parent: mainWindow,
            transient_for: mainWindow,
            destroy_with_parent: true,
            deletable: true,
            resizable: false,
            type: Gtk.WindowType.TOPLEVEL,
            window_position: Gtk.WindowPosition.CENTER_ON_PARENT,
            type_hint: Gdk.WindowTypeHint.DIALOG
        );
        this.mainWindow = mainWindow;
    }

    construct
    {
        add (settings_general ());
        add (settings_sources ());

        show_all ();
    }

    private Hdy.PreferencesPage settings_general () {
        Hdy.PreferencesPage page = new Hdy.PreferencesPage ();
        page.set_title (_("General"));
        page.set_icon_name ("applications-system-symbolic");

        // Appearance
        Hdy.ActionRow appearance_dark = new Hdy.ActionRow ();
        appearance_dark.set_title (_("Theme"));

        Hdy.PreferencesGroup appearance_options = new Hdy.PreferencesGroup ();
        appearance_options.title = _("Appearance");
        appearance_options.add (appearance_dark);

        page.add (appearance_options);
        
        return page;
    }

    private Hdy.PreferencesPage settings_sources () {
        Hdy.PreferencesPage page = new Hdy.PreferencesPage ();
        page.set_title (_("Sources"));
        page.set_icon_name ("application-x-addon-symbolic");

        // Updates
        Hdy.ActionRow updates_security = new Hdy.ActionRow ();
        updates_security.set_title (_("Security updates"));

        Hdy.ActionRow updates_recommended = new Hdy.ActionRow ();
        updates_recommended.set_title (_("Recommended updates"));

        Hdy.ActionRow updates_unsupported = new Hdy.ActionRow ();
        updates_unsupported.set_title (_("Unsupported updates"));

        Hdy.ActionRow updates_prereleased = new Hdy.ActionRow ();
        updates_prereleased.set_title (_("Pre-released updates"));

        Hdy.PreferencesGroup updates_options = new Hdy.PreferencesGroup ();
        updates_options.title = _("Updates");
        updates_options.add (updates_security);
        updates_options.add (updates_recommended);
        updates_options.add (updates_unsupported);
        updates_options.add (updates_prereleased);

        page.add (updates_options);
        
        return page;
    }
}