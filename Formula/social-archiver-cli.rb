class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.18/social-archiver-cli_0.1.18_darwin_arm64.zip"
      sha256 "4f6f8c7d2bbb63440a2c008dba93a2712910e864f2a85d722844d0a7eacd557f"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.18/social-archiver-cli_0.1.18_darwin_x64.zip"
      sha256 "2441fc54701ffe8451dba619f057dd0458a7d66bd70a49875b8c555e4f4eb9c9"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.18/social-archiver-cli_0.1.18_linux_x64.tar.gz"
      sha256 "e00e01942524da324d2be27611190e7ee531dd676a3e22afdefdc151463ea604"
    end
  end

  def install
    libexec.install "social-archiver", "social-archiver-credential-helper"
    env = { SOCIAL_ARCHIVER_CREDENTIAL_HELPER: libexec/"social-archiver-credential-helper" }
    if OS.mac?
      # Apple Intelligence provider for `social-archiver executor` (macOS 26+, Apple silicon).
      libexec.install "social-archiver-applefm"
      env[:SOCIAL_ARCHIVER_APPLEFM_HELPER] = libexec/"social-archiver-applefm"
    end
    (bin/"social-archiver").write_env_script libexec/"social-archiver", env
  end

  test do
    assert_match "social-archiver #{version}", shell_output("#{bin}/social-archiver --version")
    system bin/"social-archiver", "status", "--host=mock"
  end
end
