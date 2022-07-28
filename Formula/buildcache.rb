class Buildcache < Formula
  desc "Compiler caching system similar to ccache"
  homepage "https://github.com/mbitsnbites/buildcache"
  url "https://github.com/mbitsnbites/buildcache/archive/refs/tags/v0.27.6.tar.gz"
  sha256 "ae56ad6c3becdbb2521abcc959fc4b6b1c61496fb60f6b30af01ca1e53bd60bd"
  license "Zlib"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", "src", "-B", "build", "-DCMAKE_BUILD_TYPE=Release", *std_cmake_args
    system "cmake", "--build", "build", "--config", "Release"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/buildcache", "-s"
  end
end
