require 'test_helper'
include ERB::Util # NOTE(chaserx): so html_escape will work, not in scope of ActionView::TestCase

class EmojiHelperTest < ActionView::TestCase
  test 'when there a colon delimited string, it encodes emoji' do
    assert_dom_equal %{<img alt="+1" src="/images/emoji/unicode/1f44d.png" style="vertical-align:middle" width="18" height="18" />}, emojify(':+1:')
    assert_dom_equal %{bug <img alt="beetle" src="/images/emoji/unicode/1f41e.png" style="vertical-align:middle" width="18" height="18" />}, emojify('bug :beetle:')
    assert_dom_equal %{Priority 0 <img alt="fire" src="/images/emoji/unicode/1f525.png" style="vertical-align:middle" width="18" height="18" />}, emojify('Priority 0 :fire:')
    assert_dom_equal %{<img alt="fire" src="/images/emoji/unicode/1f525.png" style="vertical-align:middle" width="18" height="18" /> Everthing is fine. <img alt="fire" src="/images/emoji/unicode/1f525.png" style="vertical-align:middle" width="18" height="18" />}, emojify(':fire: Everthing is fine. :fire:')
    assert_dom_equal %{<img alt="octocat" src="/images/emoji/octocat.png" style="vertical-align:middle" width="18" height="18" /> &amp; <img alt="squirrel" src="/images/emoji/shipit.png" style="vertical-align:middle" width="18" height="18" />}, emojify(':octocat: & :squirrel:')
  end
end
