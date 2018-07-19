// Discord4Slack Custom Theme
document.addEventListener('DOMContentLoaded', function() {

    let tt__customCss = `
	.c-reaction--reacted, .rxn.user_reacted { background-color: #2C2F33 !important; border-color: #7289da !important; }
	.rxn.user_reacted .emoji_rxn_count, .c-reaction--reacted .c-reaction__count { color: #7289da !important; border-color: #7289da !important; }
	ts-message:hover, ts-thread .collapse_inline_thread_container:hover, ts-thread .view_all_replies_container:hover { background: #2C2F33 !important; }
	ts-message, ts-thread .thread_messages { background: #23272A; }
	#threads_msgs_scroller_div .threads_caught_up_divider .divider_label { background: #7289DA; }
	#threads_msgs_scroller_div .threads_caught_up_divider .divider_line { border-top: 1px solid #7289da; }
	#file_comment_textarea.texty_comment_input, .comment_form .texty_comment_input, .edit_comment_form .texty_comment_input { background: #23272A !important; border: 1px solid #99AAB5 !important; }
    `;
    $.ajax({
        url: 'https://gist.githubusercontent.com/tom-hightower/64c37e1382221a30b4198a9cb7d29fe0/raw/0bdd1fe4ccfe4fb522abf9b3aa690a3188004b69/tomsDarkSlack.css',
        success: function(css) {
            $('<style></style>').appendTo('head').html(css + tt__customCss);
        }
    });
});
