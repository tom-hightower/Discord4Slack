// Discord4Slack Custom Theme
document.addEventListener('DOMContentLoaded', function() {

    let tt__customCss = `
	.c-reaction--reacted, .rxn.user_reacted { background-color: #2C2F33 !important; border-color: #7289da !important; }
	.rxn.user_reacted .emoji_rxn_count, .c-reaction--reacted .c-reaction__count { color: #7289da !important; border-color: #7289da !important; }
	.c-search_autocomplete__suggestion__highlighted, .p-share_dialog_message_input { background-color: #2C2F33 !important; border: 1px solid #7289da !important; color: #FFF !important; }
	.c-search_autocomplete__suggestion_content .c-search_autocomplete__suggestion_text .token, .c-search_autocomplete__suggestion_content, .ql-container.texty_single_line_input { color: #FFF !important; }
	ts-message:hover, ts-thread .collapse_inline_thread_container:hover, ts-thread .view_all_replies_container:hover { background: #2C2F33 !important; }
	.c-search_modal .popover>div, .c-search__input_box, .c-search_autocomplete footer, .c-dialog__content, .c-dialog__header, .c-dialog__footer { background: #23272A; color: #FFF; }
	.c-search__input_and_close { border-bottom: 1px solid #7289da !important; }
	.c-search, .p-search_filter__title_text { color: #FFF; background: #23272A !important; }
	ts-message, ts-thread .thread_messages { background: #23272A; }
	.p-flexpane_header, #flex_contents .heading { background: #23272A; border-bottom: 1px solid #7289da; }
	.c-dialog__footer .p-file_upload_dialog__footer_share_inputs, .c-dialog__title, #flex_contents .heading_text { color: #FFF; }
	.p-downloads_list__shift_hint { background: linear-gradient(180deg,hsla(0,0%,100%,0),#23272A 25%,#23272A); }
	.p-download_item__container .p-download_item__name_row { color: #FFF; }
	#threads_msgs_scroller_div .threads_caught_up_divider .divider_label { background: #7289DA; }
	#threads_msgs_scroller_div .threads_caught_up_divider .divider_line { border-top: 1px solid #7289da; }
    `;
    $.ajax({
        url: 'https://gist.githubusercontent.com/tom-hightower/64c37e1382221a30b4198a9cb7d29fe0/raw/20798c6241ebfe889f47cc2e232e1958e5797281/tomsDarkSlack.css',
        success: function(css) {
            $('<style></style>').appendTo('head').html(css + tt__customCss);
        }
    });
});
