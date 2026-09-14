class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.14/social-archiver-cli_0.1.14_darwin_arm64.zip"
      sha256 "b1ec26640168b9dbb5bd1528f525b4415691f810bb96ae95d9f87df51db8680a"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.14/social-archiver-cli_0.1.14_darwin_x64.zip"
      sha256 "ccb929e332848dedafdbc9f1e033615e484210b5c9914fb61eb1ee6513a100e1"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.14/social-archiver-cli_0.1.14_linux_x64.tar.gz"
      sha256 "ba07e32dc4a72ac8b0d8575da4faee3fbf66c3fd6b36e3803f1f3fbba0e51b39"
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
