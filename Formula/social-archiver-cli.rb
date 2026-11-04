class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.2.1/social-archiver-cli_0.2.1_darwin_arm64.zip"
      sha256 "9e049b7fb078e71f49bcda2705a6b4e2bd2b01941a727d7b23b22e5571aae1dc"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.2.1/social-archiver-cli_0.2.1_darwin_x64.zip"
      sha256 "8a4066c1be9f286cc442ec198dbca2bba22511cfa3f17b787bd0e02441e89900"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.2.1/social-archiver-cli_0.2.1_linux_x64.tar.gz"
      sha256 "66306d36bb31359f31607e05583ff7932216d8365773294ac127b6abce082655"
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
