// Discord4Slack Custom Theme
document.addEventListener('DOMContentLoaded', function() {

    let tt__customCss = `
	.rxn.user_reacted .emoji_rxn_count, .c-reaction--reacted .c-reaction__count { color: var(--blurple) !important;  background-color: var(--notBlack) !important; border-color: var(--blurple) !important; }
	.c-search_autocomplete__suggestion__highlighted, .p-share_dialog_message_input { background-color: var(--notBlack) !important; border: 1px solid var(--blurple) !important; color: var(--fullWhite) !important; }
	.c-input_select { background-color: var(--trueGrey) !important; border: 1px solid var(--blurple) !important; color: var(--fullWhite) !important; }
	input[type=text], .p-file_list__file_type_select .c-input_select__selected_value--placeholder { color: var(--fullWhite) !important; box-shadow: none !important; }
	.c-search_autocomplete__suggestion_content .c-search_autocomplete__suggestion_text .token, .c-search_autocomplete__suggestion_content, .ql-container.texty_single_line_input { color: var(--fullWhite) !important; }
	.c-filter_input, .c-input_select_options_list_container { color: var(--fullWhite); background-color: var(--trueGrey) !important; border: 1px solid var(--blurple) !important; }
    `;
    $.ajax({
        url: 'https://raw.githubusercontent.com/tom-hightower/Discord4Slack/master/src/discordTheme.css',
        success: function(css) {
            $('<style></style>').appendTo('head').html(css + tt__customCss);
        }
    });
});
