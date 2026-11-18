# Kept current by .github/workflows/bump.yml. Edit by hand only to change structure.
class Nodimargo < Formula
  desc "Impact analysis for Salesforce metadata"
  homepage "https://github.com/magia-practica/nodimargo-release"
  version "0.4.0"
  license :cannot_represent

  base = "https://github.com/magia-practica/nodimargo-release/releases/download/v#{version}"

  # The sha256 values are filled in by the bump workflow.
  on_macos do
    on_arm do
      url "#{base}/nodimargo-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "fb34f6db2567e894bb3e15d989dceea10d0a9d29e3f7d2f94f966cef72b46ab8"
    end
    on_intel do
      url "#{base}/nodimargo-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "39858f15932ff3fac2f684effc5dd41f7649a28b109820235a9979abffd4235c"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/nodimargo-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7adeb8266f5cee2cb1a3fa4905df65f4d8b241dd3394010bb4af4742dd59ea66"
    end
    on_intel do
      url "#{base}/nodimargo-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07000abb5d0ad2970658e4dfbb83becbdacad2eeef7004ff12ce74b5a8be1f92"
    end
  end

  def install
    bin.install "nodimargo"
    doc.install "README.md" if File.exist?("README.md")
    doc.install "THIRD-PARTY-LICENSES.txt" if File.exist?("THIRD-PARTY-LICENSES.txt")
  end

  def caveats
    <<~EOS
      nodiMargo is commercial software. Activate a Developer or CI license
      to remove the unlicensed reminder.

      Update with `brew upgrade nodimargo` rather than `nodimargo update`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nodimargo --version")
  end
end
