class SocialArchiverCli < Formula
  desc "Archive web and social content from your terminal"
  homepage "https://github.com/hyungyunlim/obsidian-social-archiver-releases"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.9/social-archiver-cli_0.1.9_darwin_arm64.zip"
      sha256 "bdea64a740e9879df3511cb6ed737df3cc61d4d85cfddf8d230fd5d96a577c1f"
    end

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.9/social-archiver-cli_0.1.9_darwin_x64.zip"
      sha256 "4d3eb99e3271509503318049ccfc25fa82e6c8a2f51648014fe817a12f21b5e4"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hyungyunlim/obsidian-social-archiver-releases/releases/download/cli-v0.1.9/social-archiver-cli_0.1.9_linux_x64.tar.gz"
      sha256 "2b1ffddc7958571378b3a0462125382d6217ccac44095b13227b7d8f895cf980"
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
