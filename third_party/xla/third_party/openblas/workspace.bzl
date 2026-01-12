load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    tf_http_archive(
        name = "openblas",
        strip_prefix = "OpenBLAS-8795fc7985635de1ecf674b87e2008a15097ffab",
        sha256 = "f5ff825b3a82417d47c2ba97606ce8a5d868f863e555025f5d4112e6dfd62e2f",
        urls = tf_mirror_urls("https://github.com/OpenMathLib/OpenBLAS/archive/8795fc7985635de1ecf674b87e2008a15097ffab.tar.gz"),
        build_file = "//third_party/openblas:openblas.BUILD",
    )
