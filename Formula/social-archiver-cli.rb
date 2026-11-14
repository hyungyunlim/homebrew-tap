class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.2.2/social-archiver-cli_0.2.2_darwin_arm64.zip"
      sha256 "0b5f841acbf66ca97242a398d52762fd5e8d52167b90818c865c758155bcd2d1"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.2.2/social-archiver-cli_0.2.2_darwin_x64.zip"
      sha256 "ae505bd9bf981cf347ab452f28b8605a625b3e2c5e830566bc20ffc547196a1e"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.2.2/social-archiver-cli_0.2.2_linux_x64.tar.gz"
      sha256 "ca63cac7e0ec7af6eac6d607ef5909d82d246134acb6c638e6b5ed1d3d0f1551"
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
