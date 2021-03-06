(lang dune 2.7)
(generate_opam_files true)
(allow_approximate_merlin)
(strict_package_deps)

(name repr)
(source (github mirage/repr))
(license ISC)
(authors "Thomas Gazagnaire" "Craig Ferguson")
(maintainers "thomas@gazagnaire.org")

(package
 (name repr)
 (depends
  (ocaml (>= 4.08.0))
  (fmt (>= 0.8.7))
  uutf
  (jsonm (>= 1.0.0))
  (base64 (>= 2.0.0)))
 (synopsis "Dynamic type representations. Provides no stability guarantee")
 (description "\
This package defines a library of combinators for building dynamic type
representations and a set of generic operations over representable types, used
in the implementation of Irmin and related packages.

It is not yet intended for public consumption and provides no stability
guarantee.
"))

(package
 (name ppx_repr)
 (depends
  (repr (= :version))
  (ppxlib (and (>= 0.12.0) (< 0.18.0)))
  ; Test dependencies inherited from [repr] (see [test/repr/dune])
  (hex :with-test)
  (alcotest (and (>= 1.1.0) :with-test)))
 (synopsis "PPX deriver for type representations")
 (description "PPX deriver for type representations"))

(package
 (name repr-bench)
 (depends
  (repr (= :version))
  (ppx_repr (= :version))
  bechamel
  yojson
  fpath
  ppx_deriving_yojson)
 (synopsis "Benchmarks for the `repr` package")
 (description "Benchmarks for the `repr` package"))

(package
 (name repr-fuzz)
 (depends
  (repr (= :version))
  (crowbar (= 0.2))
  (ppxlib (and (>= 0.12.0) (< 0.18.0))))
 (synopsis "Fuzz tests for the `repr` package")
 (description "Fuzz tests for the `repr` package"))
