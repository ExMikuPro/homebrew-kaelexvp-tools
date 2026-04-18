class Kaeldock < Formula
  desc "Terminal SDK manager with a full-screen TUI"
  homepage "https://github.com/ExMikuPro/KaelDock"
  url "https://github.com/ExMikuPro/KaelDock/archive/refs/heads/main.tar.gz"
  version "0.0.0-main"
  sha256 "fa98774022ac84e42a6feb0f53e06ff5827523b6bf1a8fa79ca76f30c01b3595"

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