require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for tweet" do
    it "finds an tweet embed" do
      result = MarkdownMedia.expanded_embed("https://twitter.com/veganstraightedge/status/863151253911511040")

      expected_result = %q{<blockquote class="twitter-tweet " data-lang="en" id=""><a href="https://twitter.com/veganstraightedge/status/863151253911511040">https://twitter.com/veganstraightedge/status/863151253911511040</a></blockquote><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an tweet embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "https://twitter.com/veganstraightedge/status/863151253911511040",
        caption: "tweet caption"
      )

      expected_result = %q{<blockquote class="twitter-tweet " data-lang="en" id=""><a href="https://twitter.com/veganstraightedge/status/863151253911511040">https://twitter.com/veganstraightedge/status/863151253911511040</a></blockquote><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an tweet embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "https://twitter.com/veganstraightedge/status/863151253911511040",
        caption: "tweet caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = %q{<blockquote class="twitter-tweet " data-lang="en" id=""><a href="https://twitter.com/veganstraightedge/status/863151253911511040">https://twitter.com/veganstraightedge/status/863151253911511040</a></blockquote><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an tweet embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "https://twitter.com/veganstraightedge/status/863151253911511040",
        caption: "tweet caption",
        link:    "http://example.com/linked-destination",
        id:      "tweet"
      )

      expected_result = %q{<blockquote class="twitter-tweet " data-lang="en" id="tweet"><a href="https://twitter.com/veganstraightedge/status/863151253911511040">https://twitter.com/veganstraightedge/status/863151253911511040</a></blockquote><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
