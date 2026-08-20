class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.11/social-archiver-cli_0.1.11_darwin_arm64.zip"
      sha256 "b1370b1473887cddb548ff7643f523030664dd1abece1343bc7d759b500a392e"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.11/social-archiver-cli_0.1.11_darwin_x64.zip"
      sha256 "1efc0a4431e858400e82daca83d09bc7f1026f8dcc64fcaae1fffbfdbd0df296"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.11/social-archiver-cli_0.1.11_linux_x64.tar.gz"
      sha256 "4bd901a5730abcb3c711d15ba112cfaa72db213b131f7ed25def67d4bcdcd337"
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
