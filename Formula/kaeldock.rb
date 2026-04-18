class Kaeldock < Formula
  desc "Terminal SDK manager with a full-screen TUI"
  homepage "https://github.com/ExMikuPro/KaelDock"
  url "https://github.com/ExMikuPro/KaelDock/archive/refs/heads/main.tar.gz"
  version "0.2.0"
  sha256 "20284d664532b42556dc7eec223f67fba76d896dcacae6dbf3231baa87b8ffea"

  depends_on "cmake" => :build
  depends_on "ncurses"

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DCMAKE_PREFIX_PATH=#{Formula["ncurses"].opt_prefix}",
           *std_cmake_args

    system "cmake", "--build", "build", "--target", "KaelexvpSDKDock"

    bin.install "build/KaelexvpSDKDock" => "kaeldock"
  end

  test do
    assert_predicate bin/"kaeldock", :exist?
    assert_predicate bin/"kaeldock", :executable?
  end
end