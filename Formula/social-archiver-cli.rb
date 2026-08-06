class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.6/social-archiver-cli_0.1.6_darwin_arm64.zip"
      sha256 "024043904ceba0f8ea2d8ca05a66b60d9bab1ee4ac245712eaf6f9e6d4142514"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.6/social-archiver-cli_0.1.6_darwin_x64.zip"
      sha256 "cf1140e24413f64040c94981658b50c6e1141c29df6a17ae180dc4fe68ae9d31"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.6/social-archiver-cli_0.1.6_linux_x64.tar.gz"
      sha256 "ec6be68e252df40228c0c4b8e98d2603845d88391634875d22e1d404ffa36a71"
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
