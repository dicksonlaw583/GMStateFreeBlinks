///@desc Paint sprite and label
draw_self();

draw_set_colour(c_white);
draw_set_font(fnt_gmsfb_text);
draw_set_valign(fa_middle);
draw_text(bbox_right+sprite_width/2, y, label);
draw_set_valign(fa_top);
