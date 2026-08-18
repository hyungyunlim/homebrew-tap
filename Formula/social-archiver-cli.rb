class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.10/social-archiver-cli_0.1.10_darwin_arm64.zip"
      sha256 "4d01872e54b100561ead80c3d2f735789c89909a54e53ed3625cf1270c33faa2"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.10/social-archiver-cli_0.1.10_darwin_x64.zip"
      sha256 "3ee2f7b67f5faaf7d04a7428a60bb77ff27c313c38d00f3fc158046f5cd54699"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.10/social-archiver-cli_0.1.10_linux_x64.tar.gz"
      sha256 "c6ae0bd12cf8a8deafec25114ba4f362a88b39a3cd84c9b440fe91ffc8a79539"
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
