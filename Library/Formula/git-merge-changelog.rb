class GitMergeChangelog < Formula
  desc "Tool for merging GNU changelogs"
  homepage "https://www.emacswiki.org/emacs/GitForEmacsDevs#UsefulAddOns"

  head do
    url "git://git.savannah.gnu.org/gnulib.git"
    depends_on "automake" => :build
    depends_on "autoconf" => :build
  end

  def install
    testdir = "testdir"
    system "./gnulib-tool", "--create-testdir", "--dir=#{testdir}", "git-merge-changelog"
    cd testdir do
      system "./configure", "--disable-debug", "--disable-dependency-tracking",
             "--prefix=#{prefix}"
      system "make"
      system "make", "install"
    end
  end
end
