class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.5/social-archiver-cli_0.1.5_darwin_arm64.zip"
      sha256 "9dac039091073d35af6be277dbfb699bd237e2ecdfefe8dd0aa2c9826f8d11fe"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.5/social-archiver-cli_0.1.5_darwin_x64.zip"
      sha256 "495fe25129f0e816ac15a3908cf75bf4663c493232a356368836087deb6e6a65"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.5/social-archiver-cli_0.1.5_linux_x64.tar.gz"
      sha256 "a97bedbd5341d27e45f2237849ccf6c256a089a882fcd211eefb9831f3ffed17"
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
