class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.2/social-archiver-cli_0.1.2_darwin_arm64.zip"
      sha256 "e1eee0bdac5cfd2c20abeb032a8ff970d03c31267f650eed2dadb12120bffadc"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.2/social-archiver-cli_0.1.2_darwin_x64.zip"
      sha256 "a4e7b69e29f9c14c22f0cd3fce4fc6c510d0ab6b917147ab5cb3374574c9905e"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.2/social-archiver-cli_0.1.2_linux_x64.tar.gz"
      sha256 "a97e79b5936d2f5e66040d645cfe0580c18ce42f30896642454b2f794ceb4531"
    end
  end

  def install
    libexec.install "social-archiver", "social-archiver-credential-helper"
    bin.write_env_script libexec/"social-archiver",
                         SOCIAL_ARCHIVER_CREDENTIAL_HELPER: libexec/"social-archiver-credential-helper"
  end

  test do
    assert_match "social-archiver #{version}", shell_output("#{bin}/social-archiver --version")
    system bin/"social-archiver", "status", "--host=mock"
  end
end
