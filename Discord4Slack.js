// Discord4Slack Custom Theme
document.addEventListener('DOMContentLoaded', function() {

    let tt__customCss = `
	.c-reaction--reacted, .rxn.user_reacted { background-color: #2C2F33 !important; border-color: #7289da !important; }
	.rxn.user_reacted .emoji_rxn_count, .c-reaction--reacted .c-reaction__count { color: #7289da !important; border-color: #7289da !important; }
	.c-search_autocomplete__suggestion__highlighted, .p-share_dialog_message_input { background-color: #2C2F33 !important; border: 1px solid #7289da !important; color: #FFF !important; }
	.c-input_select { background-color: #545454 !important; border: 1px solid #7289da !important; color: #FFF !important; }
	input[type=text], .p-file_list__file_type_select .c-input_select__selected_value--placeholder { color: #FFF !important; box-shadow: none !important; }
	.c-search_autocomplete__suggestion_content .c-search_autocomplete__suggestion_text .token, .c-search_autocomplete__suggestion_content, .ql-container.texty_single_line_input { color: #FFF !important; }
	.c-filter_input, .c-input_select_options_list_container { color: #FFF; background-color: #545454 !important; border: 1px solid #7289da !important; }
	ts-message:hover, ts-thread .collapse_inline_thread_container:hover, ts-thread .view_all_replies_container:hover { background: #2C2F33 !important; }
	.c-search_modal .popover>div, .c-search__input_box, .c-search_autocomplete footer, .c-dialog__content, .c-dialog__header, .c-dialog__footer { background: #23272A; color: #FFF; }
	.c-search__input_and_close { border-bottom: 1px solid #7289da !important; }
	.c-search, .p-search_filter__title_text, .p-file_upload_dialog__preview, .modal-header, .p-file_flexpane--list, .c-pillow_file_container, .c-pillow_file__title { color: #FFF !important; background: #23272A !important; }
	ts-message, ts-thread .thread_messages, .c-input_select--open_panel, .p-app_actions_dialog__message, .p-app_actions_dialog .c-dialog__footer, .p-app_actions_pillow { background: #23272A !important; }
	.c-dialog__footer .p-file_upload_dialog__footer_share_inputs, .c-dialog__title, #flex_contents .heading_text, .searchable_member_list_filter .faux_input { color: #FFF; }
	.p-downloads_list__shift_hint, p-app_actions_pillow--gradient { background: linear-gradient(180deg,hsla(0,0%,100%,0),#23272A 25%,#23272A); }
	.p-download_item__container .p-download_item__name_row, .c-input_select_options_list__option, .p-app_dialog__title_text, .p-app_dialog_elements, .c-input_textarea { color: #FFF; }
	#threads_msgs .inline_message_input_container.with_file_upload .inline_file_upload:hover .upload_plus_icon { color: #7289da !important; }
	#threads_msgs .inline_message_input_container.with_file_upload .inline_file_upload, .reply_input_container .inline_message_input_container .ql-container.focus, #threads_msgs .inline_message_input_container.with_file_upload, .reply_input_container .inline_message_input_container .ql-container { background: #545454 !important; border-color: #545454 !important; }
	#threads_msgs_scroller_div .threads_caught_up_divider .divider_label, .ts_toggle.checked .ts_toggle_button, { background: #7289DA !important; }
	#threads_msgs_scroller_div .threads_caught_up_divider .divider_line { border-top: 1px solid #7289da; }
    `;
    $.ajax({
        url: 'https://gist.githubusercontent.com/tom-hightower/64c37e1382221a30b4198a9cb7d29fe0/raw/93ba2cb46566d897000b2f8643cad3f47e26c029/tomsDarkSlack.css',
        success: function(css) {
            $('<style></style>').appendTo('head').html(css + tt__customCss);
        }
    });
});
