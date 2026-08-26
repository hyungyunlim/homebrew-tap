class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.12/social-archiver-cli_0.1.12_darwin_arm64.zip"
      sha256 "307b39c34c85e61b599d00f1614aaa4fa2316b7b1a017fe98d3cd27c82eea915"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.12/social-archiver-cli_0.1.12_darwin_x64.zip"
      sha256 "70508b02dc4da9ac47cf19b038adcf5afc5e2b5960d8d257b759fe190a30c218"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.12/social-archiver-cli_0.1.12_linux_x64.tar.gz"
      sha256 "b66a4611dea1b6773ae69da05a0b46227ae4c9f4f495f97ad1a16482bfda27d8"
    end
  end

  def install
    libexec.install "social-archiver", "social-archiver-credential-helper"
    credential_helper = libexec/"social-archiver-credential-helper"
    (bin/"social-archiver").write_env_script libexec/"social-archiver",
                                             SOCIAL_ARCHIVER_CREDENTIAL_HELPER: credential_helper
  end

  test do
    assert_match "social-archiver #{version}", shell_output("#{bin}/social-archiver --version")
    system bin/"social-archiver", "status", "--host=mock"
  end
end
