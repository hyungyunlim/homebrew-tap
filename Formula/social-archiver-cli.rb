class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.8/social-archiver-cli_0.1.8_darwin_arm64.zip"
      sha256 "636e3a0f48c04da3efc77535717d12c1618044e473e9bd1c67e3a61bbe876b11"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.8/social-archiver-cli_0.1.8_darwin_x64.zip"
      sha256 "c16adf7b6d40536c2f1ca9f3045eca47e864daa3f1fa301b55bbd7045048739c"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.8/social-archiver-cli_0.1.8_linux_x64.tar.gz"
      sha256 "749b5b3af77b45ff6a6f83c581f337b5119cff63a77dd2ba8c0121b9b6463105"
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
