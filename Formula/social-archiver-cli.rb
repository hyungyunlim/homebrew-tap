class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.13/social-archiver-cli_0.1.13_darwin_arm64.zip"
      sha256 "ab114e314be7d56fd47388753e54bd7448c6a535b9fbb6c0e7a2a24d89d0f7e8"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.13/social-archiver-cli_0.1.13_darwin_x64.zip"
      sha256 "b5282843a9089bde907324b94531a2b9740a0b342a365c096925ca983a259d82"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.13/social-archiver-cli_0.1.13_linux_x64.tar.gz"
      sha256 "9502f712af59cf9c848f16476b193a8c8b9e8be4d37cffa23d57642cce7a97ab"
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
