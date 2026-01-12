load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    tf_http_archive(
        name = "openblas",
        strip_prefix = "OpenBLAS-0.3.29",
        sha256 = "38240eee1b29e2bde47ebb5d61160207dc68668a54cac62c076bb5032013b1eb",
        urls = tf_mirror_urls("https://github.com/OpenMathLib/OpenBLAS/archive/8795fc7985635de1ecf674b87e2008a15097ffab.tar.gz"),
        build_file = "//third_party/openblas:openblas.BUILD",
    )
