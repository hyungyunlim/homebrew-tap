class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.7/social-archiver-cli_0.1.7_darwin_arm64.zip"
      sha256 "3abea7a2cddb96dcae95e5613ad0b3a55764919e6e6d0a17496a14adfc05d934"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.7/social-archiver-cli_0.1.7_darwin_x64.zip"
      sha256 "f77bf614018fbea58ac8a5f6084170b517a9a5f7367e47486bcd28ce1d882eda"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.7/social-archiver-cli_0.1.7_linux_x64.tar.gz"
      sha256 "79b5be673dbad9814bb2b123585cfb28bb29e0b1b054c8172dd6f9f223bbed7d"
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
