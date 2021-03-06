class AdrTools < Formula
  desc "A command-line tool for working with Architecture Decision Records (ADRs)."
  homepage "https://github.com/npryce/adr-tools"
  url "https://codeload.github.com/npryce/adr-tools/tar.gz/2.1.0"
  sha256 "1ef028cfeaa1b262a5c62845aa8965be169705370983f9ff73b17ec77bf75f70"

  def install
    inreplace 'src/adr-init', '$(dirname $0)', prefix
    inreplace 'src/adr-new', 'ADR_TEMPLATE:-$(dirname $0)/template.md', "ADR_TEMPLATE:-#{prefix}/template.md"

    prefix.install Dir["src/*.md"]
    bin.install Dir["src/*"] - Dir["src/*.md"]
  end

  test do
    system "true"
  end
end
