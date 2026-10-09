class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.22/social-archiver-cli_0.1.22_darwin_arm64.zip"
      sha256 "14d62d2b3ea349a7d93cce373b720e12dff90ce0e07ad18e35684edeca757c3a"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.22/social-archiver-cli_0.1.22_darwin_x64.zip"
      sha256 "1e1acd26ea9ae98a3335be13e2a0605b14ae246048eea0dcbb4237dd98919653"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.22/social-archiver-cli_0.1.22_linux_x64.tar.gz"
      sha256 "765b153781fe861b95f2281285db440fb5cba24d0bca6efebe0ea71f8c9d66a3"
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
