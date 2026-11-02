class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.23/social-archiver-cli_0.1.23_darwin_arm64.zip"
      sha256 "02a2dbe24a0a2206d427a4de31343899bd663dd036b513213e91256aa95c23bf"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.23/social-archiver-cli_0.1.23_darwin_x64.zip"
      sha256 "9fd5578b953ece994f93cb999c79df04e80886d0c46a929242425882adafa483"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.23/social-archiver-cli_0.1.23_linux_x64.tar.gz"
      sha256 "7a6a869690d2b5a212c2cbcd343c52d486b87e7c19011416defb687051274f58"
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
