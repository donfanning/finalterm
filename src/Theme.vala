/*
 * Copyright © 2013 Philipp Emanuel Weidmann <pew@worldwidemann.com>
 *
 * Nemo vir est qui mundum non reddat meliorem.
 *
 *
 * This file is part of Final Term.
 *
 * Final Term is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Final Term is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Final Term.  If not, see <http://www.gnu.org/licenses/>.
 */

public class Theme : Object {

	public string name { get; set; }
	public string author { get; set; }

	public Mx.Style style { get; set; }

	public int gutter_size { get; set; }
	public Clutter.Color gutter_color { get; set; }
	public Clutter.Color gutter_border_color { get; set; }

	public int collapse_button_x { get; set; }
	public int collapse_button_y { get; set; }
	public int collapse_button_width { get; set; }
	public int collapse_button_height { get; set; }

	public Clutter.Color menu_button_arrow_color { get; set; }

	public int margin_left { get; set; }
	public int margin_right { get; set; }

	public int cursor_minimum_opacity { get; set; }
	public int cursor_maximum_opacity { get; set; }
	public int cursor_blinking_interval { get; set; }

	public int cursor_motion_speed { get; set; }

	public Theme.load_from_file(string filename) {
		var theme_file = new KeyFile();
		try {
			theme_file.load_from_file(filename, KeyFileFlags.NONE);
		} catch (Error e) { error(_("Could not load theme %s: %s"), filename, e.message); }

		try {
			name   = theme_file.get_string("About", "name");
			author = theme_file.get_string("About", "author");

			style = new Mx.Style();
			style.load_from_file(Utilities.get_absolute_filename(filename,
					theme_file.get_string("Theme", "stylesheet")));

			gutter_size = theme_file.get_integer("Theme", "gutter-size");

			gutter_color = Clutter.Color.from_string(theme_file.get_string("Theme", "gutter-color"));
			gutter_border_color = Clutter.Color.from_string(theme_file.get_string("Theme", "gutter-border-color"));

			collapse_button_x = theme_file.get_integer("Theme", "collapse-button-x");
			collapse_button_y = theme_file.get_integer("Theme", "collapse-button-y");
			collapse_button_width = theme_file.get_integer("Theme", "collapse-button-width");
			collapse_button_height = theme_file.get_integer("Theme", "collapse-button-height");

			menu_button_arrow_color = Clutter.Color.from_string(theme_file.get_string("Theme", "menu-button-arrow-color"));

			margin_left = theme_file.get_integer("Theme", "margin-left");
			margin_right = theme_file.get_integer("Theme", "margin-right");

			cursor_minimum_opacity = theme_file.get_integer("Theme", "cursor-minimum-opacity");
			cursor_maximum_opacity = theme_file.get_integer("Theme", "cursor-maximum-opacity");
			cursor_blinking_interval = theme_file.get_integer("Theme", "cursor-blinking-interval");

			cursor_motion_speed = theme_file.get_integer("Theme", "cursor-motion-speed");
		} catch (Error e) { warning(_("Error in theme %s: %s"), filename, e.message); }
	}

}
