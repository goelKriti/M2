-- -*- coding:utf-8 -*-

star := IMG { "src" => replace("PKG","Style",currentLayout#"package") | "GoldStar.png", "alt" => "a gold star" }

document {
     Key => "changes to Macaulay2, by version",
     Subnodes => {
--	  TO "changes made for the next release",
	  TO "changes, 1.25.05",
	  TO "changes, 1.24.11",
	  TO "changes, 1.24.05",
	  TO "changes, 1.23",
	  TO "changes, 1.22",
	  TO "changes, 1.21",
	  TO "changes, 1.20",
	  TO "changes, 1.19.1",
	  TO "changes, 1.19",
	  TO "changes, 1.18",
	  TO "changes, 1.17",
	  TO "changes, 1.16",
	  TO "changes, 1.15",
	  TO "changes, 1.14",
	  TO "changes, 1.13",
	  TO "changes, 1.12",
	  TO "changes, 1.11",
	  TO "changes, 1.10",
	  TO "changes, 1.9.2",
	  TO "changes, 1.9.1",
	  TO "changes, 1.9",
	  TO "changes, 1.8.2",
	  TO "changes, 1.8.1",
	  TO "changes, 1.8",
	  TO "changes, 1.7",
	  TO "changes, 1.6",
	  TO "changes, 1.5",
	  TO "changes, 1.4",
	  TO "changes, 1.3.1",
	  TO "changes, 1.3",
	  TO "changes, 1.2",
      	  TO "changes, 1.0 and 1.1",
	  TO "list of obsolete functions"
	  }
     }

-- helper code for listing new/certified packages
-- single new package:    changesHelper "NewPackage"
-- multiple new packages: changesHelper {"NewPackage1", "NewPackage2"}
-- certified package:     changesHelper("NewPackage", Certification => true)

changesHelper := method(Options => {Certification => false})
changesHelper String := opt -> pkgname -> changesHelper({pkgname}, opt)
changesHelper List := opt -> pkgnames -> (
    getName := x -> (new OptionTable from x).Name;
    commaAnd := x -> concatenate (
	if #x > 2 then (between (", ", drop(x, -1)), ", and ", x#-1)
	else between (" and ", x));
    scan(pkgnames, pkgname -> (
	    pkg := needsPackage pkgname;
	    << "LI { "
	    << (if opt.Certification then "star, \" \", " else "")
	    << "TO \"" << pkgname << "::" << pkgname << "\", \", a package by "
	    << commaAnd apply((options pkg).Authors, getName)
	    << " for " << (options pkg).Headline << ", has been "
	    << (if opt.Certification then "published" else "added")
	    << ".\" },"
	    << endl)))

-*
document {
    Key => "changes made for the next release"
    }
*-

document {
    Key => "changes, 1.25.05",
    UL {
	LI { BOLD "upcoming breaking changes:",
	    UL {
		LI { "Beginning in the 1.25.11 release, current routines involving chain complexes and graded modules
		    will be superseded by new functorial homological algebra routines in the ", TO "Complexes::Complexes",
		    " package. Users and package developers are encouraged to preview the upcoming changes by adding ",
		    TT "HomologicalAlgebraPackage = \"Complexes\"", " to their ", TO "initialization file", " and
		    reporting any bugs via email or ", HREF{"https://github.com/Macaulay2/M2/issues/3778", "GitHub"}, "." },
	    }
	},
	LI { "packages that have been published and certified:",
	    UL {
		LI { star, " ", TO "AbstractSimplicialComplexes::AbstractSimplicialComplexes", ", a package by Nathan Grieve for abstract simplicial complexes, has been published." },
		LI { star, " ", TO "ForeignFunctions::ForeignFunctions", ", a package by Doug Torrance providing a foreign function interface, has been published." },
		LI { star, " ", TO "RealRoots::RealRoots", ", a package by Jordy Lopez Garcia, Kelly Maluccio, Frank Sottile, and Thomas Yahl for symbolically exploring, counting, and locating real solutions to general polynomial systems, has been published." }
		}
	    },
	LI { "new packages:",
	    UL {
		LI { "The package ", TO "OldChainComplexes::OldChainComplexes", " has been added to preserve the existing
		    functionality of chain complexes, graded modules, and resolutions for backwards compatibility." },
		LI { TO "AllMarkovBases::AllMarkovBases", ", a package by Alexander Milner and Oliver Clarke for computing all minimal Markov bases of a configuration matrix, has been added." },
		LI { TO "Brackets::Brackets", ", a package by Dalton Bidleman, Tim Duff, Jack Kendrick, and Michael Zeng for brackets, Grassmann-Cayley algebras, and projective geometry, has been added." },
		LI { TO "ConnectionMatrices::ConnectionMatrices", ", a package by Paul Goerlach, Joris Koefler, Mahrud Sayrafi, Anna-Laura Sattelberger, Hendrik Schroeder, Nicolas Weiss, and Francesca Zaffalon for connection matrices and integrable systems from D-ideals, has been added." },
		LI { TO "GameTheory::GameTheory", ", a package by Erin Connelly, Vincenzo Galgano, Zhuang He, Lars Kastner, Giacomo Maletto, Elke Neuhaus, Irem Portakal, Hannah Tillmann-Morris, and Chenyang Zhao for computing equilibria in game theory, has been added." },
		LI { TO "IncidenceCorrespondenceCohomology::IncidenceCorrespondenceCohomology", ", a package by Annet Kyomuhangi, Emanuela Marangone, Claudiu Raicu, and Ethan Reed for cohomology on the incidence correspondence, bundles of principal parts, and Lefschetz properties, has been added." },
		LI { TO "IntegerProgramming::IntegerProgramming", ", a package by Mike Cummings for solving integer programs with Gröbner bases, has been added." },
		LI { TO "Oscillators::Oscillators", ", a package by John Cobb, Hal Schenck, and Michael E. Stillman for analyzing graph oscillators, has been added." },
		LI { TO "ToricHigherDirectImages::ToricHigherDirectImages", ", a package by Sasha Zotine for computations involving pushforwards and higher direct images of toric maps, has been added." },
		}
	    },
	LI { "improved packages:",
	    UL {
		LI { TO "AbstractSimplicialComplexes::AbstractSimplicialComplexes", " has been updated to version 1.1 with cosmetic updates."},
		LI { TO "ForeignFunctions::ForeignFunctions", " has been updated to version 0.5."},
		LI { TO "GeometricDecomposability::GeometricDecomposability", " has been updated to version 1.4.2 with minor updates."},
		LI { TO "JSON::JSON", " has been updated to version 0.4."},
		LI { TO "LieTypes::LieTypes", " has been updated to version 0.9 with various improvements."},
		LI { TO "MatrixSchubert::MatrixSchubert", " has been updated to version 1.2 with a bug fix and documentation improvements."},
		LI { TO "MultigradedBGG::MultigradedBGG", " has been updated to version 1.2 with documentation improvements."},
		LI { TO "Permutations::Permutations", " has been updated to version 1.1, adding several new methods."},
		LI { TO "RealRoots::RealRoots", " has been updated to version 1.1." },
		LI { TO "Style::Style", " has been updated to version 1.1 and now exports a ", TO "Style::generateGrammar", " method for generating grammars for syntax highlighting."},
		LI { TO "TerraciniLoci::TerraciniLoci", " has been updated to version 0.3."},
		LI { TO "ThinSincereQuivers::ThinSincereQuivers", " has been updated to version 0.1 with expanded documentation, fixed typos, and functionality added."},
		LI { TO "ToricVectorBundles::ToricVectorBundles", " has been updated to version 1.3 with a bug fix."},
		LI { TO "Varieties::Varieties", " has been updated to version 0.3." },
		LI { TO "Visualize::Visualize", " has been updated to version 1.7." },
		}
	    },
	LI { "functionality added or improved:",
	    UL {
		LI { "The profiler has been updated significantly.  ", TO symbol profile, " is now a keyword that will accept any Macaulay2 code.  Run ",
		    TO profileSummary, " or ", TO coverageSummary, " to view the profiling results."},
		LI { "The ", TO (random, QQ), " method has been added." },
		LI { TO gcd, " and ", TO lcm, " now accept a single argument." },
		LI { TO Vector, " objects belonging to modules of rank 1 may now be added, subtracted, and tested for equality with elements from their underlying rings." },
		LI { TO pairs, " will now accept any instance of class for which an ", TO iterator, " method is installed."},
		LI { TO applyPairs, ", ", TO scanPairs, ", and ", TO selectPairs, " will now accept any object that works with ", TO pairs, "."},
		LI { TO vector, " now accepts a ring as its first argument for constructing elements of free modules." },
		LI { TO format, " now escapes all control characters in a string." },
		LI { "It is now possible to write ", M2CODE "new ... from", " methods that accept 2 or 3 arguments.  See ", TO symbol new, "."},
		LI { M2CODE "intersection", " is now a synonym for ", TO intersect, "."},
		LI { TO directProduct, ", formerly exported by ", TO "Polyhedra::Polyhedra", ", has been moved to Core and now accepts any positive number of arguments."},
		LI { "The ", TO sign, " method has been added."},
		LI { "Package documentation pages now display BibTeX citation information, provided by ", TO "PackageCitations::cite", "."},
		LI { "There now exists a ", TO Citation, " documentation keyword for overriding the default package citation information provided by ", TO "PackageCitations::cite", "."},
		LI { "There are now several additional ", TO round, " methods."},
		LI { TO needsPackage, " will now reload a package if its source has been modified since the last time it was loaded." },
		LI { "Several new ", TO check, " methods have been added."},
		LI {TO randomSubset, " has been added for generating random subsets of lists and sets."},
		},
	    },
	LI { "functionality changed in a way that could break code:",
	    UL {
		LI { "The method ", TO "Isomorphism :: isIsomorphism", " now only returns true or false. ",
		    "To retrieved the computed isomorphism, use the method ", TO "Isomorphism :: isomorphism", "." },
		LI { "The method ", TO (symbol\\, Matrix, Matrix), " is now a shortcut for ", TO (quotient', Matrix, Matrix), ". ",
		    "The previous functionality is still available via ", TO (symbol//, Matrix, Matrix), ", which is a shortcut for ",
		    TO (quotient, Matrix, Matrix), ". Additionally, both methods now work for maps of non-free modules."},
		LI { TO (leadTerm, Ideal), " now returns an ideal instead of a matrix." },
		LI { TO gcdCoefficients, " now returns a sequence instead of a list." },
		}
	    }
	}
    }

document {
    Key => "changes, 1.24.11",
    UL {
	LI { "packages that have been published and certified:",
	    UL {
		LI { star, " ", TO "A1BrouwerDegrees::A1BrouwerDegrees", ", a package by Nikita Borisov, Thomas Brazelton, Frenly Espino, Tom Hagedorn, Zhaobo Han, Jordy Lopez Garcia, Joel Louwsma, Wern Juin Gabriel Ong, and Andrew Tawfeek for A1-Brouwer degree computations, has been published." },
		LI { star, " ", TO "SpecialFanoFourfolds::SpecialFanoFourfolds", ", a package by Giovanni Staglianò for Hodge-special fourfolds, has been published." },
		LI { star, " ", TO "SubalgebraBases::SubalgebraBases", ", a package by Michael Burr, Oliver Clarke, Timothy Duff, Jackson Leaman, Nathan Nichols, and Elise Walker for Canonical subalgebra bases (aka SAGBI/Khovanskii bases), has been published." }
		}
	    },
	LI { "new packages: ",
	    UL {
		LI { TO "AbstractSimplicialComplexes::AbstractSimplicialComplexes", ", a package by Nathan Grieve for abstract simplicial complexes, has been added." },
		LI { TO "Msolve::Msolve", ", a package by Martin Helmer, Mike Stillman, and Anton Leykin for interfacing with the msolve library for solving multivariate polynomial systems using Gröbner Bases, has been added." },
		LI { TO "MultigradedImplicitization::MultigradedImplicitization", ", a package by Joseph Cummings and Benjamin Hollering for solving implicitization problems using multigradings, has been added." },
		LI { TO "NumericalSemigroups::NumericalSemigroups", ", a package by David Eisenbud and Frank-Olaf Schreyer for computing the Apery set and invariants of a numerical semigroup ring, has been added." },
		LI { TO "Permutations::Permutations", ", a package by Sean Grate for functions for working with permutations, has been added." },
		LI { TO "SCMAlgebras::SCMAlgebras", ", a package by Ernesto Lax for sequentially Cohen-Macaulay modules or ideals, has been added." }
		}
	    },
	LI { "improved packages:",
	    UL {
		LI { TO "A1BrouwerDegrees::A1BrouwerDegrees", " has been updated to version 1.1 with bug fixes and improved documentation."},
		LI { TO "AssociativeAlgebras::AssociativeAlgebras", " has been updated to version 0.9 with new functions related to derivation-quotient algebras, superpotentials, and Nakayama automorphisms of m-Koszul Artin-Schelter regular algebras."},
		LI { TO "ForeignFunctions::ForeignFunctions", " has been updated to version 0.4 with improved documentation."},
		LI { TO "Jets::Jets", " has been updated to version 1.2 with improvements and new methods for principal jets."},
		LI { TO "LieTypes::LieTypes", " has been updated to version 0.82 with bug fixes, improved documentation, and a new method, ", TO "LieTypes::zeroModule", "."},
		LI { TO "PositivityToricBundles::PositivityToricBundles", " has been updated to version 1.9 with bug fixes and a new method, ", TO "PositivityToricBundles::wellformedBundleFiltrations", "."},
		LI { TO "Probability::Probability", " has been updated to version 0.5 with improved documentation." },
		LI { TO "Seminormalization::Seminormalization", " has been updated to version 0.22 with several improvements."},
		LI { TO "TerraciniLoci::TerraciniLoci", " has been updated to version 0.2 with minor updates." },
		LI { TO "Triangulations::Triangulations", " has been updated to version 0.2 with a bug fix." },
		LI { TO "VectorGraphics::VectorGraphics", " has been updated to version 1.1 with several improvements."},
		LI { TO "Visualize::Visualize", " has been updated to version 1.6 with improvements to the JavaScript code."}
		}
	    },
	LI { "functionality added or improved:",
	    UL {
		LI { "A new function ", TO headlines, " is now available for viewing a table of documentation
		    headlines from a list produced by ", TO methods, ", ", TO about, ", or ", TO apropos, "."},
		LI { "It is now possible to construct an empty matrix by passing an empty list to ", TO matrix, "." },
		LI { TO LUdecomposition, " now supports empty real and complex matrices." },
		LI { "The ", TO "version", " hash table now contains a \"git branch\" key." },
		LI { "The version number displayed in the startup banner now includes git information." },
		LI { TO copyright, " is now a command that displays the ", TO "Copyright and license", " documentation."},
		LI { "A number of improvements have been made to methods dealing with ", TO MonomialIdeal, " objects."},
		LI { "The function ", TO remove, ", which previously had no return value, now returns the value that was removed." },
		LI { "The function ", TO changeDirectory, ", for changing the working directory, has been added." },
		LI { "Many numerical functions that previously did not accept ", TO CC, " or ", TO RRi, " arguments now do." },
		LI { "The functions ", TO selectKeys, ", ", TO selectValues, ", and ", TO selectPairs, " for selecting from hash tables have been added." },
		LI { "It is now possible to edit the list of packages that are loaded when Macaulay2 starts up by modifying the list ", M2CODE "Core#\"preloaded packages\"", " in ", CODE "init.m2", "." },
		LI { "The classes ", TO Constant, ", ", TO InfiniteNumber, " and ", TO IndeterminateNumber, " are now all subclasses of ", TO Number, "."},
		LI { "Hash codes are now unsigned 64-bit integers, vastly reducing the probability of running out when creating new types."},
		LI { "It is now possible to compare ", TO GroebnerBasis, " objects using ", TO symbol ==, "." },
		LI { "Items in the \"ways to use\" section of documentation pages are now formatted using ", TO "Text::KBD", "."},
		LI { "It is now possible to use ", TO symbol try, " with ", TO symbol then, ", but without ", TO symbol else, "."},
		LI { "When running Macaulay2 without the ", CODE "--no-readline", " option, command history is now saved between sessions.  This history can be found in the file ", CODE "history.m2", " in the ", TO applicationDirectory, "."},
		LI { "The error message is now more informative when a key is not found in a hash table." },
		LI { "New methods for scalar division, e.g., ", TO (symbol /, Matrix, Number), " have been added." },
		LI { "The restriction on promotion/lifting has been relaxed so one can promote/lift between any two rings, and apply this to fraction fields and tensor products." }
		}
	    },
	LI { "functionality changed in a way that could break code:",
	    UL {
		LI { "The behavior of ", TO basis, " over tower rings has changed. Previously basis was computed
		    over the most recent coefficient ring, but now it is computed over the first coefficient ring.
		    Previous behavior can be mimicked by passing the option ", TT "basis(..., Variables => gens R)", "." },
		LI { "Testing equality of zero modules using ", TO symbol ==, " so that two zero modules are equal if they are equal as cosets.  The only implication is that zero submodules of any free module are now the same, but zero submodules of arbitrary modules are only the same if they have the same ambient module." },
		LI { "The syntactic sugar ", CODE "T OP= f", " for ", TO "installing augmented assignment methods", " has been removed." },
		LI { TO symbol TEST, " is now a keyword instead of a method function.  It functionality remains essentially unchanged.  However, its ", TO FileName, " option has been removed.  Use ", M2CODE "TEST get(...)", " instead when storing the code for a test in a file." }
		}
	    }
	}
    }

document {
    Key => "changes, 1.24.05",
    UL {
	LI { "packages that have been published and certified:",
	    UL {
		LI { star, " ", TO "CotangentSchubert::CotangentSchubert", ", a package by Paul Zinn-Justin for Cotangent Schubert calculus, has been published." },
		LI { star, " ", TO "GeometricDecomposability::GeometricDecomposability", ", a package by Mike Cummings and Adam Van Tuyl to check whether ideals are geometrically vertex decomposable, has been published." },
		LI { star, " ", TO "InvariantRing::InvariantRing", ", a package by Luigi Ferraro, Federico Galetto, Francesca Gandini, Hang Huang, Thomas Hawes, Matthew Mastroeni, and Xianglong Ni for invariants of group actions, has been published." },
		LI { star, " ", TO "MultiplicitySequence::MultiplicitySequence", ", a package by Justin Chen, Youngsu Kim, and Jonathan Montaño for computing the multiplicity sequence of an ideal, has been published." },
		LI { star, " ", TO "Probability::Probability", ", a package by Doug Torrance for basic probability functions, has been published." },
		LI { star, " ", TO "TropicalToric::TropicalToric", ", a package by Alessio Borzì on tropical methods for toric intersection theory, has been published." }
		}
	    },
	LI { "new packages:",
	    UL {
		LI { TO "MultigradedBGG::MultigradedBGG", ", a package by Maya Banks, Michael K. Brown, Tara Gomes, Prashanth Sridhar, Eduardo Torres Davila, and Sasha	Zotine for the multigraded BGG correspondence and differential modules, has been added." },
		LI { TO "TropicalToric::TropicalToric", ", a package by Alessio Borzì on tropical methods for toric intersection theory, has been added." },
		LI { TO "VNumber::VNumber", ", a package by Antonino Ficarra and Emanuele Sgroi to compute v-number of homogeneous ideals and v-function of monomial ideals, has been added." }
		}
	    },
	LI { "improved packages:",
	    UL {
		LI { "Many ", TO "FourTiTwo::FourTiTwo", " methods now have a ", TO Precision, " option for setting the integer precision used by 4ti2."},
		LI { TO "GeometricDecomposability::GeometricDecomposability", " has been updated to version 1.4.1 with minor updates."},
		LI { TO "NumericalAlgebraicGeometry::NumericalAlgebraicGeometry", " has been updated to version 1.24 with small updates."},
		LI { TO "PositivityToricBundles::PositivityToricBundles", " has been updated to version 1.7, adding several new methods, fixing bugs, and updating the documentation and tests. "},
		LI { TO "ToricVectorBundles::ToricVectorBundles", " has been updated to version 1.2 with updated documentation."},
		LI { TO "WhitneyStratifications::WhitneyStratifications", " has been updated to version 2.03, adding new routines to stratify algebraic maps to the package. The update also includes several performance improvements and bug fixes." },
		}
	    },
	LI { "functionality added or improved:",
	    UL {
		LI { "It is now possible to create a fraction field of an iterated polynomial ring using ", TO frac, "."},
		LI { "A number of new operators have been added that may be used for defining methods.  See ", TO symbol ^!, ", ",
		    TO symbol _!, ", ", TO symbol ^~, ", ", TO symbol _~, ", ", TO symbol ^>, ", ", TO symbol ^>=, ", ", TO symbol ^<, ", ",
		    TO symbol ^<=, ", ", TO symbol _>, ", ", TO symbol _>=, ", ", TO symbol _<, ", ", TO symbol _<=, ", ", TO symbol |_, ", and ",
		    TO symbol |_=, "." },
		LI { "A number of improvements have been made to parallelization. In particular:",
		    UL {
			LI { "The function ", TO getIOThreadMode, " has been added for determining the current I/O thread mode. "},
			LI { "The functions ", TO setIOExclusive, ", ", TO setIOSynchronized, ", and ", TO setIOUnSynchronized, " now also accept a file as an argument." },
			LI { "The default I/O thread mode has been changed from 0 (unsynchronized) to 1 (synchronized)." },
			LI { "Much of the code (e.g., reading mutable hash tables) is now thread safe." },
			LI { "The output of ", TO GCstats, " has been improved." },
			LI { "The initial heap size used by the garbage collector has been increased and the free space divisor has been decreased." },
			LI { "The ", TO taskResult, " function now waits until a task is finished before returning its result." },
			LI { "The ", TO parallelApply, " function has been added for applying a function to a list in parallel." },
			LI { "The output when using the ", TO symbol time, " keyword now includes the time used by the current thread and in garbage collection. "},
			LI { "The keyword ", M2CODE "threadVariable", " has been renamed to ", TO symbol threadLocal, ", although the former still exists as a synonym."}
			},
		    "See ", TO "parallel programming with threads and tasks", " for more."
		    },
		LI { "The hash counter for mutable hash tables increases much more slowly, decreasing the likelihood of overflowing." },
		LI { "The ", TO take, " function will now accept a two-element list as its second element if the class of the first element has a ", TO iterator, " method installed."},
		LI { "Broken links to the ", HREF{"https://msp.org/jsag/", "Journal of Software for Algebra and Geometry"}, " have been fixed in the documentation for older certified packages."},
		LI { "The documentation page for each certified package now includes its DOI."},
		LI { "The ", TO union, " function has been added for sets." },
		LI { "The ", TO intersect, " and ", TO intersection, " functions now work for sets."},
		LI { "Creating integer quotient rings using ", M2CODE "ZZ/n", " now works when ", VAR "n", " is large and/or composite."},
		LI { "The syntax ", CODE "g \\\\ f", " as a synonym for ", CODE "f // g", " when ", VAR "f", " and ", VAR "g", " are matrices has been deprecated.  ",
		     "It will be replaced in the next release."},
		LI { "Modules may now be compared using ", TO symbol <, ", ", TO symbol <=, ", ", TO symbol >, ", and ", TO symbol >=,
		    ", by their ranks and degrees.  In particular, lists of modules may now be sorted."},
		LI { "The method ", TO (homomorphism, Vector), " was added for getting the homomorphism from an element of a Hom module."},
		LI { "The method ", TO (random, Module), " was added for generating random elements of modules."},
		LI { "The method ", TO (all, BasicList), " was added for checking if all elements of a list of booleans are true."},
		LI { "The method ", TO (position, ZZ, Function), " was added for finding the smallest index for which a function returns true." }
		}
	    }
	}
    }

document {
     Key => "changes, 1.23",
     UL {
	  LI { "packages that have been published and certified:",
	       UL {
		   LI { star, " ", TO "BettiCharacters::BettiCharacters", ", a package by Federico Galetto for finite group characters on free resolutions and graded modules, has been published." },
		   LI { star, " ", TO "FastMinors::FastMinors", ", a package by Boyana Martinova, Marcus Robinson, Karl Schwede, and Yuhui (Wei) Yao for faster linear algebra operations, has been published." },
		   LI { star, " ", TO "MixedMultiplicity::MixedMultiplicity", ", a package by Kriti Goel, Vivek Mukundan, Sudeshna Roy, and J. K. Verma for Mixed Multiplicities of ideals, has been published." },
		   LI { star, " ", TO "RandomPoints::RandomPoints", ", a package by Sankhaneel Bisui, Zhan Jiang, Sarasij Maitra, Thai Nguyen, Frank-Olaf Schreyer, and Karl Schwede for find a point in a given variety over a finite field, has been published." },
		   LI { star, " ", TO "SimplicialComplexes::SimplicialComplexes", ", a package by Gregory G. Smith, Ben Hersey, and Alexandre Zotine for exploring abstract simplicial complexes within commutative algebra, has been published." }
		   }
	       },
	  LI { "new packages:",
	       UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { "The package ", TO "Dmodules::Dmodules", " is now an umbrella package which, for compatibility with old code, loads ",
			TO "WeylAlgebras::WeylAlgebras", ", ", TO "HolonomicSystems::HolonomicSystems", ", and ", TO "BernsteinSato::BernsteinSato", ". ",
			"The new addition ", TO "WeylAlgebras::WeylAlgebras", ", contains basic constructors and methods for working with Weyl algebras
			which used to be in the ", TO "Dmodules::Dmodules", " package." },
		    LI { "The package ", TO "Varieties::Varieties", " has been added to encapsulate existing and new functionality for working
			with affine and projective varieties and coherent sheaves on them. The package adds support for maps of coherent sheaves." },
		    LI {TO "A1BrouwerDegrees::A1BrouwerDegrees", ", a package by Nikita Borisov, Thomas Brazelton, Frenly Espino, Tom Hagedorn, Zhaobo Han, Jordy Lopez Garcia, Joel Louwsma, Andrew Tawfeek, and Wern Juin Gabriel Ong for for working with A1-Brouwer degree computations, has been added." },
		    LI {TO "AdjunctionForSurfaces::AdjunctionForSurfaces", ", a package by Frank-Olaf Schreyer for Adjunction for Surfaces, has been added." },
		    LI {TO "MatrixSchubert::MatrixSchubert", ", a package by Ayah Almousa, Sean Grate, Daoji Huang, Patricia Klein, Adam LaClair, Yuyuan Luo, and Joseph McDonough for functions for investigating ASM and matrix Schubert varieties, has been added." },
		    LI {TO "OIGroebnerBases::OIGroebnerBases", ", a package by Michael Morrow for OI-modules over Noetherian polynomial OI-algebras, has been added." },
		    LI {TO "PlaneCurveLinearSeries::PlaneCurveLinearSeries", ", a package by David Eisenbud for Linear series on the normalization of a plane curve, has been added." },
		    LI {TO "QuadraticIdealExamplesByRoos::QuadraticIdealExamplesByRoos", ", a package by David Eisenbud, Michael Perlman, Ritvik Ramkumar, Deepak Sireeshan, Aleksandra Sobieska, Teresa Yu, and Jacob Zoromski for Examples of Quadratic Ideals with Embedding Dimension Four by Jan-Erik Roos, has been added." },
		    LI {TO "RInterface::RInterface", ", a package by Doug Torrance for interface to R for statistical computing, has been added." },
		    LI {TO "TerraciniLoci::TerraciniLoci", ", a package by Francesco Galuppi, Pierpaola Santarsiero, Doug Torrance, and Ettore Teixeira Turatti for Terracini loci of projective varieties, has been added." },
		    LI {TO "Valuations::Valuations", ", a package by Michael Burr, Colin Alstad, Michael Byrd, Ethan Partida, Shelby Cox, Courtney George, and Oliver Clarke for implementation of valuations for rings, has been added." },
		    }
	       },
	  LI { "functionality added or improved:",
	       UL {
		    LI { "Most flexible binary operators now have a corresponding ", TO "augmented assignment", " operator.  For example, ",
			 SAMP "x += 1", " is equivalent to ", SAMP "x = x + 1", "."},
		    LI { "A new type, ", TO AtomicInt, ", has been introduced providing atomic operations for use in parallel programs." },
		    LI { "The null coalescing operator ", TO symbol ??, " has been added to the Macaulay2 language." },
		    LI { "A polynomial ", SAMP "f", " may now be evaluated at a ring element or sequence of ring elements ", SAMP "x", " using ",
			SAMP "f(x)", ".  The existing syntax, ", SAMP "f[x]", ", has been deprecated and may be removed in a future release. ",
			"See ", TO (symbol SPACE, RingElement, Sequence), "." },
		    LI { "The method ", TO (isMember, RingElement, Ideal), " has been added to test membership in an ideal." },
		    LI { "When given just a module and no integer, ", TO hilbertFunction, " will now a return a function that accepts integers and ",
			 "returns the corresponding values of the Hilbert function of the module." },
		    LI { "Torsion is now taken into account when adding, subtracting, and negating matrices." },
		    LI { "The source and target modules of a matrix will now be printed when both are free and/or have been assigned to global ",
			 "variables.  Previously, they were only printed when both were free."},
		    LI { "If a module in a chain complex has been assigned to a global variable, then that variable will appear when the complex ",
			 "is printed, unless it is a free module."},
		    LI { "Several improvements have been made to ", TO vector, " for constructing elements of modules."},
		    LI { "It is now possible to view the code of a function defined on the standard input using ", TO code, "."},
		    LI { "The particular subclass of ", TO Function, " is now displayed when a function that has not been assigned to a global ",
			 "variable is printed." },
		    LI { "The \"standalone\" class is now used by ", TO showTex, " so that the size of the resulting document will match the size ",
			 "of the object being viewed." },
		    LI { "Several new escape sequences have been added for strings:  ", SAMP "\\a", " (for audible bell), ", SAMP "\\e",
			 " and ", SAMP "\\E", " (for escape), ", SAMP "\\v", " (for vertical tab), and ", SAMP "\\x", " (for indicating a character ",
			 "using its ASCII encoding in hexadecimal).  See ", TO "\"", "." },
		    LI { "Both ", TO exportFrom, " and ", TO importFrom, " now accept either a string or ", TO Package, " object as their first argument ",
			 "and either a string or a list of strings as their second argument." },
		    LI { TO "FLINT", " version 3 is now supported."},
		    LI { SAMP "libatomic_ops", " has been dropped as a dependency and has been replaced with C11 and C++11 standard atomic operations." },
            LI { "Some computations in the engine (e.g. minimal betti diagrams and Gröbner bases over associative algebras), ",
                  "can now take advantage of multiple CPU cores, see ", TO "parallelism in engine computations", "."}
		    }
	       },
	  LI { "Emacs updates:",
	       UL {
	            LI { "Indentation in the Macaulay2 major mode is now more consistent with other Emacs majors modes.  For example, it now respects ",
			 "the Electric Indent minor mode.  In particular, it is possible to toggle whether code is automatically indented after pressing ",
			 KBD "Return", " by running ", SAMP "M-x electric-indent-mode", "." },
		    LI { "The Macaulay2 Interaction major mode now respects the ", SAMP "comint-use-prompt-regexp", " variable.  This controls how ",
			 "many lines are sent to Macaulay2 when pressing ", KBD "Return", " after scrolling up to previous input.  If the variable is ",
			 "set to ", SAMP "t", ", then one line will be sent.  If it is set to ", SAMP "nil", " (the default), then the entire input ",
			 "field will be sent." },
		    LI { "The function ", SAMP "M2-send-to-program", " (which is bound to ", KBD "F11", " by default), is now only intended to be ",
			 "called from the Macaulay2 major mode.  A new function, ", SAMP "M2-send-input-or-get-input-from-demo-buffer", " has been ",
			 "added (and bound to ", KBD "F11", ") for the Macaulay2 Interaction major mode.  The user experience should remain unchanged." }
		    }
	       }
	  }
     }

document {
     Key => "changes, 1.22",
     UL {
	  LI { "packages that have been published and certified:",
	       UL {
		    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
		    LI { star, " ", TO "GraphicalModelsMLE::GraphicalModelsMLE", ", a package by 
			 Carlos Amendola, Luis David Garcia Puente, Roser Homs Pons, Olga Kuznetsova, 
			 Harshit J Motwani, Elina Robeva, and David Swinarski, for maximum likelihood
			 estimates for graphical statistical models, has been published." },
		    LI { star, " ", TO "LinearTruncations::LinearTruncations", ", a package by Lauren Cranton Heller,
			  David Eisenbud, and Navid Nemati for finding multigraded truncations that give linear resolutions, 
			  has been published."
			  },
	     	    LI { star, " ", TO "RationalMaps::RationalMaps", ", a package by Karl Schwede,
			  Daniel Smolkin, S. Hamid Hassanzadeh, and C. J. Bott, for working with rational maps, has been published." },
		    LI { star, " ", TO "PseudomonomialPrimaryDecomposition::PseudomonomialPrimaryDecomposition", ", a package by Alan 
			 A. Veliz-Cuba for primary decomposition of square free pseudomonomial ideals, has been published."},
		    LI { star, " ", TO "NoetherianOperators::NoetherianOperators", ", a package by Robert Krone, Justin Chen,
			  Marc Harkonen, Yairon Cid-Ruiz, and Anton Leykin, for numerically computing local dual spaces, 
			  Hilbert functions, and Noetherian operators, has been published." },
		    LI { star, " ", TO "Jets::Jets", ", a package by Federico Galetto and 
			 Nicholas Iammarino, for computing jets of various algebraic, geometric and combinatorial objects, has been published." }
	     	    }
	       },
	  LI { "new packages:",
	       UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { TO "HolonomicSystems::HolonomicSystems", ", a package by Mahrud Sayrafi, Christine Berkesch, Anton Leykin, and 
			 Harrison Tsai for holonomic systems, has been added.  The code was originally in the Dmodules package." },
		    LI { TO "BernsteinSato::BernsteinSato", ", a package by Anton Leykin and Harrison Tsai for Bernstein-Sato, 
			 has been added.  The code was originally in the Dmodules package." },
		    LI { TO "PolyominoIdeals::PolyominoIdeals", ", a package by Carmelo Cisto, Francesco Navarra, and Rizwan Jahangir for 
			 binomial ideals of collections of cells, has been added." },
		    LI { TO "MatchingFields::MatchingFields", ", a package by Oliver Clarke for matching fields, has been added." },
		    LI { TO "CellularResolutions::CellularResolutions", ", a package by Jay Yang and Aleksandra Sobieska for 
			 cellular resolutions of monomial ideals, has been added." },
		    LI { TO "SagbiGbDetection::SagbiGbDetection", ", a package by Viktoriia Borovik, Timothy Duff, and Elima Shehu for verifying
			  whether the given generators of an ideal form the Gr\"obner basis or whether the given generators of a finitely 
			  generated subalgebra of a polynomial ring are the SAGBI basis, has been added." }
		    }
	       },
	  LI { "functionality added:",
	       UL {
		    LI { "A ", TO RingMap, " object may now be raised to the 0th power if its ", TO source, " and ", TO target, " agree." },
		    LI { "Matrices may now be joined with any type of number (not just integers) using ", TO2((symbol |, Matrix, Matrix), "|"), " and ",
			 TO2((symbol ||, Matrix, Matrix), "||"), "."},
		    LI { "The html documentation now syntax highlights Macaulay2 code by default using ", HREF{"https://prismjs.com/", "Prism"}, "."},
		    LI { "Some improvements have been made to ", TO findProgram, " and ", TO runProgram, "."},
		    LI { "A specific test from a package may now be specified using ", TO (tests, ZZ, Package), "."},
		    LI { "The html documentation now uses the HTML5 specification."}
	       }
	  },
	  LI { "functionality changed in a way that could break code:",
	       UL {
		    LI { "The functions ", TT "member", " and ", TT "mutable", " have been renamed to ", TO isMember, " and ", TO isMutable, ", respectively.  ",
			 "The old names still exist as synonyms, but they may be removed in a future release." },
		    LI { "Raising a matrix to the 0th power will now raise an error if the ", TO source, " and ", TO target, " do not agree."},
		    LI { "The value of a class's ", TT "1", " key (used internally for getting multiplicative identities) should now be a function that takes ",
			 "an instance of the class and returns the multiplicative identity rather than the multiplicative identity itself."},
		    LI { "The function ", TO urlEncode, " has been moved from the ", TO "OnlineLookup::OnlineLookup", " package to ", TO Core, ", and its behavior has been ",
			 "slightly modified."}
	       }
	  },
	  LI { "Emacs updates:",
	       UL {
		    LI { "Several new functions have been added to for sending code to an M2 process, and the code that is sent is now highlighted briefly as a ",
			 "visual indicator.  Refer to the \"Macaulay2\" dropdown menu in Emacs for more."},
		    LI { "File locations that appear in Macaulay2 Interaction buffers are now handled using ",
			  HREF{"https://www.gnu.org/software/emacs/manual/html_node/emacs/Compilation-Mode.html", "Compilation mode"}, "."},
		    LI { "Macaulay2 is now supported in Org Mode using ", HREF{"https://github.com/d-torrance/ob-M2", "ob-M2"}, "."}
	       }
	  }
     }
}

document {
     Key => "changes, 1.21",
     UL {
	  LI { "new packages:",
	       UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { TO "Triangulations::Triangulations", ", a package by Mike Stillman for triangulations of polyhedra and point sets, has been added." },
		    LI { TO "WhitneyStratifications::WhitneyStratifications", ", a package by Martin Helmer for computing Whitney stratifications algebraically, has been added." },
		    LI { TO "JSON::JSON", ", a package by Doug Torrance for JSON encoding and decoding, has been added." },
		    LI { TO "ForeignFunctions::ForeignFunctions", ", a package by Doug Torrance for providing a foreign function interface, has been added." },
		    LI { TO "GeometricDecomposability::GeometricDecomposability", ", a package by Mike Cummings and Adam Van Tuyl for determining whether ideals are geometrically vertex decomposable, has been added." },
		    LI { TO "PseudomonomialPrimaryDecomposition::PseudomonomialPrimaryDecomposition", ", a package by Alan A. Veliz-Cuba for primary decomposition of square free pseudomonomial ideals, has been added." }
		    }},
	  LI { "improved packages:",
               UL {
       	    	    LI { "The package ", TO "BettiCharacters::BettiCharacters", 
                	 " has been updated to version 2.0, which introduces
			 character tables, decompositions, and other methods for characters.
			 The GradedCharacter type has been removed, and the Character type
			 has been modified to accommodate both homological and internal
			 grading in a simplified format." 
                	 }
		     }
		 },
	  LI { "functionality added:",
	       UL {
		    LI { "New methods, ", TO iterator, " and ", TO next, ", and a new class, ", TO Iterator, " have been added to allow iteration over any Macaulay2 object." },
		    LI { TO "for", " loops, as well as the methods ", TO scan, ", ", TO apply, ", ", TO select, ", ", TO fold, ", ", TO accumulate, ", ", TO take, ", and ", TO join, ", now work with any iterable object." },
		    LI { TO (truncate, Number), " has been added, rounding numbers toward zero." },
		    LI { TO (quotientRemainder, ZZ, ZZ), " has been added, for obtaining the quotient and remainder simultaneously when performing integer division." },
		    LI { "The bitwise not operator, ", TO (symbol ~, ZZ), " has been added." },
		    LI { "A new strategy ", TO "Dynamic", " is implemented for ", TO "det", ", ", TO "minors", ", and ", TO "exteriorPower", "." },
		    LI { "A new global variable ", TO "blockMatrixForm", " which affects the display of matrices has been added." },
		    LI { "Partial support for UTF-8 in strings has been added." },
		    LI { TO changeBase, " has been added for changing integer bases."}
		    }
	       },
	  LI { "functionality changed in a way that could break code:",
	       UL {
		    LI { TO remove, " may now be used to remove elements from mutable lists.  Its previous (undocumented) behavior was equivalent to ", TO drop, "."},
		    LI { TO characters, " and ", TO (width,Net)," now split strings according to UTF-8 characters rather than bytes." }
		    }
	       }
	  }}
    
document {
     Key => "changes, 1.20",
     UL {
	  LI { "new packages:",
	       UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { TO "CotangentSchubert::CotangentSchubert", ", a package by Paul Zinn-Justin for cotangent Schubert calculus, has been added." },
		    LI { TO "OnlineLookup::OnlineLookup", ", a package by Paul Zinn-Justin for looking up mathematical information online, has been added." },
		    LI { TO "MergeTeX::MergeTeX", ", a package by Paul Zinn-Justin for running Macaulay2 code and inserting the results into a LaTeX file, has been added." },
		    LI { TO "Probability::Probability", ", a package by Doug Torrance for basic probability, has been added." },
		    LI { TO "Isomorphism::Isomorphism", ", a package by David Eisenbud for probabilistic searching for isomorphisms between modules, has been added." },
		    LI { star, " ", TO "SchurVeronese::SchurVeronese", ", a package by Juliette Bruce, Daniel Erman, Steve Goldstein and Jay Yang for examining data for Veronese embeddings of projective space, has been added and published." },
		    LI { star, " ", TO "CodingTheory::CodingTheory", ", a package by Taylor Ball, Eduardo Camps, Henry Chimal-Dzul, Delio Jaramillo-Velez, Hiram H. Lopez, Nathan Nichols, Matthew Perkins, Ivan Soprunov, German Vera, and Gwyn Whieldon for coding theory, has been added and published." },
		    }
	       },
	  LI { "packages that have been published and certified:",
	       UL {
		    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
		    LI { star, " ", TO "ThreadedGB::ThreadedGB", ", a package by Sonja Petrovic and Shahrzad Zelenberg, for computing a Gröbner basis using the classical Buchberger algorithm with multiple threads, has been published." },
		    LI { star, " ", TO "MultiprojectiveVarieties::MultiprojectiveVarieties", ", a package by Giovanni Staglianò for multi-projective varieties, has been published." },
		    }
	       },
	  LI { "improved packages:",
               UL {
       	    	    LI { "The package ", TO "GraphicalModelsMLE::GraphicalModelsMLE", 
                	 " has been improved following many recommendations
       	        	 through its certification process. Several
       	        	 computations have been optimized. The names of several
       	        	 procedures and options have been modified. " 
                	 },
  		    LI { "The package ", TO "Complexes::Complexes", 
                	 " has been improved.  The documentation has been
                	 enhanced, numerous minor bugs have been fixed, and
                	 free resolutions have been implemented independent of
                	 the current ", TO "ChainComplex", " class."
                	 },
  		    LI { "The package ", TO "HyperplaneArrangements::HyperplaneArrangements", 
                	 " has been improved.  It includes several improvements
                	 in the basic code, increased functionality with the
                	 Matroids package, completely rewritten documentation,
                	 numerous bug fixes, and better consistency with
                	 Macaulay2 conventions."
                	 },
  		    LI { "The package ", TO "SimplicialComplexes::SimplicialComplexes", 
                	 " has been improved.  It adds constructors for many
                	 classic examples, implements a new data type for
                	 simplicial maps, incorporates many improvements to the
                	 methods, improves interoperability with ", 
                	 TO "Polyhedra::Polyhedra", " and completely overhauls the
                	 documentation. Changes that break backwards
                	 compatibility include changing the output of faces and
                	 facets from Matrix to List, changing the output type
                	 of fVector from HashTable to List, and replacing ==
                	 with === for SimplicialComplexes."
                	 }
	       	    }},
 	  LI { "functionality added:",
	       UL {
		    LI { "New functions ", TO "memoizeValues", " and ", TO "memoizeClear", " have been added for dealing with the values retained by functions created with memoize." },
		    LI { "A new method ", TO "uniquePermutations", " has been added. Equivalent to ", M2CODE "unique @@ permutations", " except faster." },
		    LI { "A number of unicode symbols have been added as synonyms, e.g., ℤ or ⊗." },
		    LI { "New numeric functions ", TO "Beta", ", ", TO "Digamma", ", ", TO "inverseErf", ", ", TO "regularizedBeta", ", ", TO "inverseRegularizedBeta", ", ", TO "regularizedGamma", ", and ", TO "inverseRegularizedGamma", ", new numeric constant ", TO "CatalanConstant",
			 ".  ", TO "Gamma", " now accepts two arguments, for the incomplete gamma function.  Numeric functions accept constants as arguments." },
		    LI { TO "pack", ", ", TO "reverse", ", and ", TO "tally", " now support strings." },
		    LI { TO "unique", " now supports all visible lists." },
		    LI { "Syntax highlighting of Macaulay2 code in the HTML documentation has been added as a build-time option.  Use ", TO "M2CODE", " to indicate code to be highlighted." }
		    }
	       },
	  LI { "functionality changed in a way that could break code:",
	       UL {
		    LI { "The update to SimplicialComplexes has several minor breaking changes, outlined above." }
		    }
	       }
	  }}

document {
     Key => "changes, 1.19.1",
     UL {
          LI { "bugs fixed:",
	       UL {
		    LI { "repaired two broken links to packages in the changes documentation" },
		    LI { "restored the 'Ways to use' and 'For the programmer' sections of the documentation provided by ", TO "help", " for a method function." }
		    }
	       }
     	  }
     }

document {
     Key => "changes, 1.19",
     UL {
	  LI { "new packages:",
	       UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { TO "MonomialIntegerPrograms::MonomialIntegerPrograms", ", a package by Lily Silverstein and Jay White for using integer programming for fast computations with monomial ideals, has been added." },
		    LI { TO "ThinSincereQuivers::ThinSincereQuivers", ", a package by Mary Barker and Patricio Gallardo for construction of flow polytopes and their associated quivers, has been added." },
		    LI { TO "Python::Python", ", a package by Daniel R. Grayson and Doug Torrance for an interface to Python, has been added." },
		    LI { TO "BettiCharacters::BettiCharacters", ", a package by Federico Galetto for finite group characters on free resolutions and graded modules, has been added." },
		    LI { TO "Jets::Jets", ", a package by Federico Galetto and Nicholas Iammarino, for computing jets of various algebraic, geometric and combinatorial objects, has been added." },
		    LI { TO "FunctionFieldDesingularization::FunctionFieldDesingularization", ", a package by Douglas A. Leonard for desingularization of function fields, has been added." },
		    LI { TO "HomotopyLieAlgebra::HomotopyLieAlgebra", ", a package by David Eisenbud for homotopy Lie algebra, has been added." },
		    LI { TO "TSpreadIdeals::TSpreadIdeals", ", a package by Luca Amata for t-spread ideals of a polynomial ring, has been added." },
		    LI { TO "ExteriorModules::ExteriorModules", ", a package by Luca Amata and Marilena Crupi for monomial modules over exterior algebras, has been added." },
		    LI { TO "GroebnerStrata::GroebnerStrata", ", a package by Kristine Jones and Mike Stillman for working with Gröbner families and subschemes of Hilbert schemes, has been added." },
            	    LI { TO "QuaternaryQuartics::QuaternaryQuartics", ", a package by Kapustka, Kapustka, Ranestad, Schenck, Stillman and Yuan containing code and examples for their paper 'Quaternary Quartic Forms and Gorenstein Rings', has been added." },
		    LI { TO "RealRoots::RealRoots", ", a package by Jordy Lopez, Kelly Maluccio, Frank Sottile, and Thomas Yahl for symbolically exploring, counting, and locating real solutions to polynomial systems, has been added." },
		    LI { TO "K3Surfaces::K3Surfaces", ", a package by Michael Hoff and Giovanni Staglianò for explicit constructions of K3 surfaces, has been added." }
		    }
	       },
 	  LI { "improved packages:",
	       UL {
		    LI { "The package ", TO "Truncations", " has been improved to support modules over the Cox rings of simplicial ", TO2 {"NormalToricVarieties", "normal toric varieties"}, "." },
		    LI { "The package ", TO "MonodromySolver::MonodromySolver", " includes several new convenience functions for manipulating systems and creating seed pairs."},
		    LI { "The package ", TO "Complexes::Complexes", " has been improved.  The documentation is complete, and all methods involving Yoneda Ext and connecting maps have been written.  This package will soon replace the chain complex code from the Core."}
		    }
	       },
	  LI { "packages that have been published and certified:",
	       UL {
		    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
		    LI { star, " ", TO "DecomposableSparseSystems::DecomposableSparseSystems", ", a package by 
		       	 Taylor Brysiewicz, Jose Israel Rodriguez, Frank Sottile, and Thomas Yahl for solving decomposable sparse systems, has been published." 
			 },
		    LI { star, " ", TO "SparseResultants::SparseResultants", ", a package by Giovanni Staglianò for computations with sparse resultants, has been published." },
		    LI { star, " ", TO "ExteriorModules::ExteriorModules", ", a package by Luca Amata and Marilena Crupi for monomial modules over exterior algebras, has been published." }     
		    }
	       },
	  LI { "packages that have been renamed:",
	       UL {
		    LI { "The package ", TT "FastLinAlg", " has been renamed to ", TO "FastMinors::FastMinors", "." },
		    LI { "The package ", TT "RandomRationalPoints", " has been renamed to ", TO "RandomPoints::RandomPoints", "." }			    
		    }
	       },
 	  LI { "functionality added:",
	       UL {
		    LI { "Integers may now be entered using the binary, octal, and hexadecimal numeral systems with the prefixes \"0b\", \"0o\", and \"0x\", respectively."},
		    LI { "A new binary operator, ", TO2 {(symbol ^^, ZZ, ZZ), "^^"}, ", has been added for computing the bitwise XOR of two integers.  This replaces the \"xor\" method."},
		    LI { "A new keyword, ", TO2 {(symbol xor, Boolean, Boolean), "xor"}, ", has been added for finding the logical XOR of two boolean objects."},
		    LI { "The function ", TO printerr, ", for printing warning messages and logs to ", TO stderr, ", is now exported."}
		    }
	       }
	  }
     }

document {
     Key => "changes, 1.18",
     UL {
     	 LI { "packages that have been published and certified:",
     	       UL {
     	       	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
	       	    LI { star, " ", TO "PhylogeneticTrees::PhylogeneticTrees", ", a package by Nathaniel Bushek, Ruth Davidson, Elizabeth Gross, Pamela Harris, Robert Krone, Colby Long, AJ Stewart, and Robert Walker for invariants for group-based phylogenetic models, has been published." },
		    LI { star, " ", TO "GradedLieAlgebras::GradedLieAlgebras", ", a package by Clas Löfwall and Samuel Lundqvist for computations in graded Lie algebras, has been published." },
	       	    LI { star, " ", TO "RelativeCanonicalResolution::RelativeCanonicalResolution", TEX ", a package by Christian Bopp and Michael Hoff for computation of the relative canonical resolution for g-nodal canonical curves with a fixed $g^1_k$, has been published." },
		    LI { star, " ", TO "FrobeniusThresholds::FrobeniusThresholds", ", a package by Juliette Bruce, Daniel Hernández, Karl Schwede, Dan Smolkin, Pedro Teixeira, and Emily Witt, for calculations of F-thresholds, has been published." }
		    }
	       },
	 LI { "new packages:",
	      UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { TO "AssociativeAlgebras::AssociativeAlgebras", ", a package by Frank Moore and Mike Stillman for noncommutative algebra, has been added." },
		    LI { TO "RationalPoints2::RationalPoints2", ", a package by Jieao Song for finding rational points on a variety, has been added." },
		    LI { TO "SuperLinearAlgebra::SuperLinearAlgebra", ", a package by Fereshteh Bahadorykhalily and Fatemeh Tarashi Kashani for computing with supermatrices, has been added." },
		    LI { TO "SubalgebraBases::SubalgebraBases", ", a package by Michael Burr, Oliver Clarke, Timothy Duff, Jackson Leaman, Nathan Nichols, Elise Walker, Mike Stillman, and Harrison Tsai, for computing canonical subalgebra bases, has been added." },
		    LI { TO "AInfinity::AInfinity", ", a package by David Eisenbud and Mike Stillman for A-infinity structures on free resolutions, has been added." },
		    LI { TO "LinearTruncations::LinearTruncations", ", a package by Lauren Cranton Heller, David Eisenbud, and Navid Nemati for finding multigraded truncations that give linear resolutions, has been added." }
		    }
	       },
	 LI { "improved packages:",
	      UL {
		   LI { "The package ", TO "NumericalSchubertCalculus::NumericalSchubertCalculus", " has been improved:
			several functions and options were added for user convenience.
			Output formats, verbosity, and documentation were greatly improved." 
			},
		   LI { "The package ", TO "VirtualResolutions::VirtualResolutions", " has been improved: a new strategy
			using a significantly faster algorithm has been added for the ", TO "VirtualResolutions::multigradedRegularity", " function."
		   	},
		   LI { "The package ", TO "NoetherianOperators::NoetherianOperators", " has been improved: the ", TO "NoetherianOperators::DiffOp", " type has
			 been reworked, and support for Noetherian operators and differential primary decompositions of modules has been added."
			 },
		   LI { "Several packages (",
		       TO "Chordal::Chordal", ", ",
		       TO "Graphs::Graphs", ", ",
		       TO "Markov::Markov", ", and ",
		       TO "Posets::Posets",
		       ") that generate and display visualizations of mathematical objects using external image viewers ",
		       "have been modified so that they no longer require package-specific configuration of these viewers.  ",
		       "Instead, ", TO "show", " is used, which opens the images using the system default viewer (using ",
		       TT "open", " on macOS and ", TT "xdg-open", " on Linux)."}
		   }
	      },
	 LI { "functionality added:",
	     UL {
		 LI {"A new type of real number, ", TO RRi, " based on interval arithmetic has been added, based on the library ", TT "mpfi", ", thanks
		      to Michael Burr, with help from Anton Leykin."},
		 LI {"The function ", TO tests, " has been added, for getting information about a package's tests."},
		 LI {"A new type of list, ", TO AngleBarList, ", has been added, for use in forming free associative algebras.
		      An instance can be created with the notation ", TT "<|x,y,z|>", "." },
	         LI {"The function ", TO assert, " now accepts an ", TO Expression, " object as its argument.
		     This provides more useful error messages for debugging, because they will contain the expression in
		     unevaluated form, which might be something like ", TT "d == 3", "."},
		 LI {"In the function ", TO "MonomialOrbits::orbitRepresentatives", " in the package ", TO "MonomialOrbits::MonomialOrbits", ",
		      it is now possible to specify a subset of monomials from which the monomials that represent orbits are chosen, or from 
		      which the monomials that represent orbits are removed."}
		 }
	     },
	LI { "functionality removed",
	     UL {
		  LI {"The type ", TT "MatrixDegreeExpression", " has been removed."},
		  LI {"The type ", TT "ModuleMap", " has been removed."}
		  }
	     }
	 }
     }
     
document {
     Key => "changes, 1.17",
     UL {
	 LI { "functionality added:",
	      UL {
		   LI { "The function ", TO importFrom, " has been added, for importing individual symbols from another package." },
		   LI { "The function ", TO readPackage, " has been added, for retrieving the options in the preamble of a package quickly." },
		   LI { "The function ", TO hooks, " has been added, for retrieving the list of functions installed as hooks for handling computations of a specific type." },
		   LI { "The function ", TO baseRing, " has been added, for retrieving the ring from which a ring was formed." },
		   LI { "The functions ", TO findProgram, " and ", TO runProgram, " have been added, to provide a uniform way for packages to locate external programs.
			(The names and locations of such programs may vary from system to system." },
		   LI { "The function ", TO formation, " has been added, for retrieving the way a module was formed, whether as a direct sum, tensor product, or Hom-module." }
		   }
	      },
         LI { "functionality improved:",
              UL {
		   LI { "The function ", TO capture, " is now used for generating most examples and tests." },
		   LI { "The function ", TO installPackage, " accepts two new argument: ",
		       TO [installPackage, MakeHTML], " and ", TO [installPackage, MakePDF], ". The PDF output will be improved in a future release." },
		   LI { "The new optional argument name ", TO "Keywords", " can now be used with packages to specify a list of key words (or phrases),
			useful for searching and organizing the packages by topic, as seen here: ", TO "packages provided with Macaulay2", "."			
			},
                   LI { "The functions ", TO addHook, " and ", TO runHooks, " have been modified to accept a new syntax,
		       allow giving names to hooks, and run specific hooks using the option ", TT "Strategy", ".
		       The symbol ", TO "Default", " has been added for use as the name of hooks.
		       The mutable hash table ", TO "GlobalHookStore", " has been added as a storage location for some hooks.
		       For more information on ", TO "using hooks", ", see that documentation node." },
                   LI { "The functions ", TO code, " is modified to also show the code for hooks listed by the function ", TO hooks, "." },
		   LI {
		       "$\\LaTeX$ typesetting for the web documentation is now rendered using ",
		       HREF{"https://katex.org/","$\\KaTeX$"}, ", a JavaScript math typesetting library for browsers.
		       As a result, $\\LaTeX$ equations and matrices are rendered correctly.
		       One notable change is that mathematical characters and equations now must be enclosed in ",
		       TT "\\(...\\)", ", ", TT "\\[...\\]", ", ", TT "$...$", ", or ", TT "$$...$$",
		       " in order to be rendered. See ", TO "Text :: html(TEX)", " for more details and examples" },
		   LI { "The option ", TO Boxes, " of ", TO netList,
		       " has been made more flexible to allow customization of the box;",
		       " it now accepts as input a pair of lists of rows and columns." },
                   LI { "A brief documentation of various types of objects can be viewed using ", TO (symbol?, Symbol), "." },
                   LI { "The ", TO document, " function now accepts three new options: ", TO "Acknowledgement", ", ",
		       TO "Contributors", ", and ", TO "References", ". The content of each will appear under a subsection
		       of the same name in the documentation. Moreover, ", TO "SimpleDoc :: document(String)", " is now a synonym for ",
		       TO "SimpleDoc :: doc(String)", "." },
                   LI { "The ", TO regex, " function, as well as other functions that accept ", TO "regular expressions",
                       ", have been rewritten to use the Perl regular expression syntax by default, which allows more
		       fine-grained control of the matches. The ", TO "POSIX", " extended flavor is still available as an option.
		       The functionality is unchanged in almost all cases, except for regular expressions containing
		       escaped special characters, where another backslash may be needed, and, in rare cases, where
		       there are multiple options to match the regular expression.
		       Internally, the new implementation incorporates the ", TO2{"Boost", "Boost.Regex"}, " library." }
                   }
              },
	 LI { "new packages:",
	      UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
	 	   LI { TO "EagonResolution::EagonResolution", ", a package by David Eisenbud and Mike Stillman for Eagon resolutions of residue fields, has been added." },
	 	   LI { TO "EigenSolver::EigenSolver", ", a package by Laurent Busé, Justin Chen, Kisun Lee, Anton Leykin, Tomas Pajdla, and Erika Pirnes for solving polynomial systems using eigen-computations, has been added." },
	 	   LI { TO "GKMVarieties::GKMVarieties", ", a package by Chris Eur and Ritvik Ramkumar for computations with GKM manifolds and moment graphs, has been added." },
	 	   LI { TO "GraphicalModelsMLE::GraphicalModelsMLE", ", a package by Carlos Amendola, Luis David Garcia Puente, Roser Homs Pons, Olga Kuznetsova, Harshit J Motwani, Elina Robeva, and David Swinarski, for maximum likelihood estimates for graphical statistical models, has been added." },
	 	   LI { TO "Hadamard::Hadamard", ", a package by Iman Bahmani Jafarloo for Hadamard products of projective subvarieties, has been added." },
     		   LI { TO "MonomialOrbits::MonomialOrbits", ", a package by David Eisenbud and Mike Stillman for orbit representatives of monomial ideals, has been added." },
		   LI { TO "MultiprojectiveVarieties::MultiprojectiveVarieties", ", a package by Giovanni Staglianò for multi-projective varieties, has been added." },
	 	   LI { TO "MultiplicitySequence::MultiplicitySequence", ", a package by Justin Chen, Youngsu Kim, and Jonathan Montaño, for computing the multiplicity sequence of an ideal, has been added." },
	 	   LI { TO "NoetherianOperators::NoetherianOperators", ", a package by Robert Krone, Justin Chen, Marc Harkonen, Yairon Cid-Ruiz, and Anton Leykin, for numerically computing local dual spaces, Hilbert functions, and Noetherian operators, has been added.
			(The package ", TT "NumericalHilbert", " has been absorbed into this new package." },
	 	   LI { TO "NumericalLinearAlgebra::NumericalLinearAlgebra", ", a package by Robert Krone, Marc Harkonen, and Anton Leykin for numerically compute local dual spaces and Hilbert functions, has been added." },
	 	   LI { TO "RandomPoints::RandomPoints", ", previously called RandomRationalPoints a package by Sankhaneel Bisui, Thai Nguyen, Karl Schwede, Sarasij Maitra, and Zhan Jiang, for computing a random point in a given variety over a finite field, has been added." },
	 	   LI { TO "ResLengthThree::ResLengthThree", ", a package by Lars Winther Christensen, Luigi Ferraro, Francesca Gandini, Frank Moore, and Oana Veliche, for multiplication in free resolutions of length three, has been added." },
	 	   LI { TO "ResolutionsOfStanleyReisnerRings::ResolutionsOfStanleyReisnerRings", ", a package by Ashleigh Adams for comparing resolutions of Stanley-Reisner rings and computing various systems of parameters, has been added." },
		   LI { TO "Saturation :: Saturation", ", a package by Justin Chen, Mahrud Sayrafi, and Mike Stillman for computations involving quotients,
		       	saturations, and annihilators of modules and ideals, has been added. The package is preloaded, so the routines
		       	from this package will be used automatically. In particular, the new implementation supports
		       	caching of computations as well as new strategies, which can be listed using the ", TO hooks,
		       	" function." },
	 	   LI { TO "StatGraphs::StatGraphs", ", a package by Carlos Amendola, Luis David Garcia Puente, Roser Homs Pons, Olga Kuznetsova, and Harshit J Motwani, for graphs used in algebraic statistics, has been added." },
	 	   LI { TO "SwitchingFields::SwitchingFields", ", a package by Zhan Jiang and Sarasij Maitra for switching base fields and obtaining natural maps, has been added." }
		   }
	       },
     	  LI { "packages that have been published and certified:",
     	       UL {
     	       	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
		    LI { star, " ", TO "VirtualResolutions::VirtualResolutions", ", a package by Ayah Almousa, Christine Berkesch,
			 Juliette Bruce, David Eisenbud, Michael Loper, and Mahrud Sayrafi for virtual resolutions on products of projective spaces, has been published." },
		    }
	       },
	 LI { "improved packages:",
	      UL {
		   LI {
		       "The ", TO "SimpleDoc :: doc(String)", " method from the ", TO "SimpleDoc :: SimpleDoc", " package
		       has been rewritten to support documenting multiple nodes at once. The following keywords were added: ",
		       TT "Node", ", ", TT "Synopsis", ", ", TT "Tree", ", ", TT "Acknowledgement", ", ", TT "Contributors", ", ",
		       TT "References", ", and ", TT "SourceCode", ". Moreover, two new functions, ", TO "SimpleDoc :: arXiv",
		       " and ", TO "SimpleDoc :: stacksProject", " were added to help with referencing external documents."
		       },
		   LI {
		       "The ", TO "PrimaryDecomposition :: PrimaryDecomposition", " package has been improved to support
		       computation of associated primes and primary decomposition of modules.
		       In addition, partial computations in this package are now cached."
		       },
		   LI {
		       "The ", TO "MinimalPrimes :: MinimalPrimes", " package has been improved and the ", TO "MinimalPrimes :: minimalPrimes",
		       " and ", TO "MinimalPrimes :: isPrime(Ideal)", " routines from that package are now used by default, deprecating the ",
		       TT "installMinprimes", " routine. A new routine ", TO "MinimalPrimes :: radicalContainment", " has been added, and
		       the function ", TO "MinimalPrimes :: radical", " is moved to this package.
		       In addition, partial computations in this package are now cached."
		       },
		   LI {
		      "Version 2.0 of ", TO "InvariantRing :: InvariantRing", " introduces types for different group actions as well as rings of invariants.
		      It also contains new functionality for computing invariants of finite groups, diagonal actions (tori/abelian groups), and linearly
		      reductive groups. The code from version 1.1.0 has been updated to work with the new types."
		       }
		   }
	       },
	 LI { "functionality changed:",
	      UL {
		   LI { "The functions ", TO "PrimaryDecomposition::associatedPrimes", ", ",
		       TO "PrimaryDecomposition::topComponents", ", and ",
		       TO "PrimaryDecomposition::removeLowestDimension", " have been moved to the
			 package ", TO "PrimaryDecomposition::PrimaryDecomposition", "." },
		   LI { "The destinations of the links at the tops of the web pages portraying documentation nodes in a package have been
			altered.  The links labeled ", TT "next", " and ", TT "previous", " have been interchanged with the links labelled ",
			TT "forward", " and ", TT "backward", ".  This was done to bring the terminology into agreement with that used in the
			info nodes portraying documentation nodes.  The result can be described as follows.  By virtue of the ",
			TO "Subnodes", " option, each node is provided with a certain number of subnodes, so the documentation as a whole may be
			regarded as an ordered union of rooted trees, with the top node of the package serving as the root of the first one.
			(Ideally it would be the only one.)  The ", TT "next", " and ", TT "previous", " links can be used to traverse the
			(sibling) subnodes of a given node, in sequence.  (The various roots are also regarded as siblings.)  The ",
			TT "forward", " and ", TT "backward", " links can be used to traverse all the nodes, in depth-first sequence.  Ideally,
			the documentation would be structured so such a traversal results in a readable document with topics presented in a
			logical sequence."
			}
		   }
	      },
	 LI { "functionality changed in a way that could break code:",
	      UL {
		   LI { "The variable ", TT "backupFileRegexp", " has been replaced by the ", TO "Exclude", "
			option to ", TO "copyDirectory", "."
			},
		   LI { "The option ", TO [installPackage, InstallPrefix], " no longer accepts a function as input.
		        only strings containing a path to the installation prefix are accepted."
			},
		   LI { "The function ", TT "localRing", " has been moved to the package ", TO "LocalRings::LocalRings", "." }
		   }
	      },
	 LI { "functionality removed",
	       UL {
		    LI { "The function ", TT "removeHook", " has been removed." },
		    LI { "The ", TT "ForestNode", " and ", TT "TreeNode", " types have been made internal." },
		    }
	      }
          }
     }


document {
     Key => "changes, 1.16",
     UL {
	 LI { "functionality added:",
	      UL {
		   LI { "The location of Macaulay2's Emacs files has changed from ", TT "site-lisp", " to ", TT "site-lisp/Macaulay2", ", so
			users, after installing this version of Macaulay2, may once again need to run ", TO "setupEmacs", " (or ", TO "setup", ")."
			}
		   }
	      },
     	  LI { "new packages:",
     	       UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { TO "SimplicialPosets::SimplicialPosets", ", a package by Nathan Nichols for constructing Stanley simplicial poset rings, has been added." },
		    LI { TO "SlackIdeals::SlackIdeals", ", a package by Amy Wiebe and Antonio Macchia for slack ideals of polytopes and matroids, has been added." },
		    LI { TO "PositivityToricBundles::PositivityToricBundles", ", a package by Andreas Hochenegger for checking positivity of toric vector bundles, has been added." },
		    LI { TO "SparseResultants::SparseResultants", ", a package by Giovanni Staglianò for computations with sparse resultants, has been added." },
		    LI { TO "DecomposableSparseSystems::DecomposableSparseSystems", ", a package by Taylor Brysiewicz, Jose Israel Rodriguez, Frank Sottile, and Thomas Yahl for solving decomposable sparse systems, has been added." },
		    LI { TO "MixedMultiplicity::MixedMultiplicity", ", a package by Kriti Goel, Sudeshna Roy, and J. K. Verma for mixed multiplicities of ideals, has  been added." },
		    LI { TO "ThreadedGB::ThreadedGB", ", a package by Sonja Petrovic, Sara Jamshidi Zelenberg, and Tanner Zielinski for computing a Gröbner basis using the classical Buchberger algorithm with multiple threads, has been added." },
		    LI { TO "PencilsOfQuadrics::PencilsOfQuadrics", ", a package by Frank-Olaf Schreyer, David Eisenbud, and Yeongrak Kim for Clifford algebras of pencils of quadratic forms, has been added." },
		    LI { TO "VectorGraphics::VectorGraphics", ", a package by Paul Zinn-Justin for producing scalable vector graphics, has been added." }
		    }
	       },
     	  LI { "packages that have been published and certified:",
     	       UL {
     	       	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
		    LI { star, " ", TO "DeterminantalRepresentations::DeterminantalRepresentations", ", a package by Justin Chen and Papri Dey for computing determinantal representations, has been published." },
		    LI { star, " ", TO "Seminormalization::Seminormalization", ", a package by Karl Schwede and Bernard Serbinowski for computing seminormalization of rings, has been published." },
		    LI { star, " ", TO "SumsOfSquares::SumsOfSquares", ", a package by Diego Cifuentes, Thomas Kahle, Pablo A. Parrilo, and Helfried Peyrl for sums of squares, has been published." }
		    }
	       },
	 LI { "functionality added:",
	      UL {
		   LI {
			"The function ", TO "installPackage", " now returns, as its value, the package that was installed.
			This makes it more convenient to both install and check a package, because one can type ", TT "check installPackage \"FOO\"", "."
			},
	           LI { "The ", TO "roots", " command is now handled by the ", TO "MPSolve", " library, and is more robust, 
                     	but no longer takes an optional argument ", TT "Unique", "."
                     	},
	           LI { "The ", TO "Complexes::Complexes", " package has new data types and routines for homological algebra.
            		Eventually, it will replace the current facilities for homological algebra. We are making this available in order to get feedback from users before
            		making this change.  Please email the authors with any and all comments or suggestions."
            		}
		   }
	      },
         LI { "functionality improved",
	       UL {
		    LI { "The PARI library has been removed.  Its functionality has been subsumed by the ", TO "MPSolve",
			" library (for the ", TO "roots", " function for finding roots of a univariate polynomial), and the ",
			TO "FLINT", " library, for integer factorization and primality testing." },
		    LI { "The ", TO2{"Boost", "Boost.Stacktrace"}, " library has been added for printing stack traces in case of a crash." },
		    LI { "Primality testing, provided by ", TO "isPrime", ", is now handled by the ", TO "FLINT", " library." },
		    LI { "Probable prime testing, provided by ", TO "isPseudoprime", ", is now handled by the ", TO "FLINT", " library." },
                    LI { "Factorization of integers, provided by ", TO (factor,ZZ), ", is now handled by the ", TO "FLINT", " library." },
                    LI { "The ", TO "FLINT", " library, and several others, no longer need to be patched while building Macaulay2.
			 This involved a reorganization of the way memory management is done in the engine and the interpreter.
		      	 As a result, we can use versions of several basic libraries as provided by the operating system, including ", 
			 TO "GNU MP", ",", TT "MPIR", ",", TO "MPFR", ", and the ", TO "NTL library", "."
			 },
		    LI {
			 TEX {
			      "The ", TO "CompleteIntersectionResolutions::CompleteIntersectionResolutions", " package now has an implementation of
			      the dual of the (infinite) Tate resolution of any module over a complete intersection $R$ as a finitely generated 
			      module over $R[t_1..t_c]$, the ring of Eisenbud operators.  As a byproduct, this gives another method for computing the 
			      global $Ext_R(M,N)$.  Also implemented {\\em layered} resolutions (in the sense of Eisenbud-Peeva) of Cohen-Macaulay modules over $R$."
			      }
			 },
		    LI { "The ", TO "ReesAlgebra::ReesAlgebra", " has new functionality, with the defaults changed to make the computation faster." }
		    }
	       }
          }
     }

document {
     Key => "changes, 1.15",
     UL {
     	  LI { "new packages:",
     	       UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { TO "VirtualResolutions::VirtualResolutions", ", a package by Ayah Almousa, Christine Berkesch, Juliette Bruce, David Eisenbud, Michael Loper, and Mahrud Sayrafi, for virtual resolutions on products of projective spaces, has been added.
			 (Actually, it was added in 1.14, but we forgot to say that in ", TO "changes, 1.14", "." },
		    LI { TO "FastMinors::FastMinors", ", previously called FastLinAlg, a package by Boyana Martinova, Marcus Robinson, Karl Schwede, and Yuhui (Wei) Yao, for faster linear algebra operations, has been added." },
		    LI { TO "FrobeniusThresholds::FrobeniusThresholds", ", a package by Juliette Bruce, Daniel Hernández, Karl Schwede, Dan Smolkin, Pedro Teixeira, and Emily Witt, for calculations of F-thresholds, has been added." },
		    LI { "The package ", TT "SOS", " has been renamed to ", TO "SumsOfSquares::SumsOfSquares", "." },
		    LI { TO "SpechtModule::SpechtModule", ", a package by Jonathan Niño for efficient computation of invariants for permutation groups, has been added." },
		    LI { TO "SpecialFanoFourfolds::SpecialFanoFourfolds", ", a package by Giovanni Staglianò for special cubic fourfolds and special prime Fano fourfolds of degree 10 and index 2, has been added." },
		    }
	       },
     	  LI { "packages that have been published and certified:",
     	       UL {
     	       	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
		    LI { star, " ", TO "NumericalImplicitization::NumericalImplicitization", ", a package by Justin Chen
			 and Joe Kileel for computing invariants of images of polynomial maps, has been published." },
		    LI { star, " ", TO "RandomMonomialIdeals::RandomMonomialIdeals", ", a package by Sonja Petrovic, Despina Stasi, Dane Wilburne, Tanner Zielinski,
			  Daniel Kosmas, Parker Joncus, Richard Osborn, Monica Yun, and Genevieve Hummel, for generating 
			  Erdos-Renyi-type random monomial ideals, has been published." },
	       	    LI { star, " ", TO "SymbolicPowers::SymbolicPowers", ", a package by Eloisa Grifo for calculations involving symbolic powers, has been published." },
	       	    LI { star, " ", TO "TestIdeals::TestIdeals", ", a package by Alberto F. Boix, Juliette Bruce, Drew Ellingson, Daniel Hernandez, 
			 Zhibek Kadyrsizova, Mordechai Katzman, Sara Malec, Matthew Mastroeni, Maral Mostafazadehfard, Marcus Robinson, Karl Schwede, Dan Smolkin, Pedro Teixeira, 
			 and Emily Witt for calculations of singularities in positive characteristic, has been published." },
		    LI { star, " ", TO "SchurComplexes::SchurComplexes", ", a new package by Michael K. Brown, Amy Huang, Robert Laudone,
			 Michael Perlman, Claudiu Raicu, Steven V. Sam, and Joao Pedro Santos, for Schur functors of chain complexes, has been added and published." }
		    }
	       },
	  LI { "functionality added or improved:",
	       UL {
		    LI { "The function ", TO "nanosleep", " has been added by Boyana Martinova and Karl Schwede.  It allows the Macaulay2 process to sleep for short periods." },
		    LI { "The sagbi engine command ", TT "rawSubduction", " has been fixed.  A new engine function ", TT "rawMonoidNumberOfBlocks", "  has been
		       	 created, which returns the number of blocks of the monomial order of the monoid (each Weight function, Lex, or GRevLex group counts as a block)"
		       	 }
		   }
	       },
	  LI {
	       "commits, issues, and pull requests on github",
	       UL {
		    LI {
			 "See ", HREF{"https://github.com/Macaulay2/M2/issues?q=milestone%3A%22version+1.15%22+is%3Aclosed","closed 1.15 issues"}, ",
			 for the issues and pull requests incorporated into 1.15."
			 },
		    LI {
			 "See ", HREF{"https://github.com/Macaulay2/M2/commits/release-1.15","1.15 commits"}, " for complete information
			 about all changes to the code incorporated into 1.15."
			 }
		    }
	       }	  
	  }
     }
 
document {
     Key => "changes, 1.14",
     UL {
	  LI { "functionality added or improved:",
	       UL {
		    LI { "A bug related to determining the correct layout of a source directory prevented the function ", TO "help", " from
			 finding the example output and merging it into the help message.  This has been fixed." 
			 },
		    LI { "A change to the way expressions interact with the reverse dictionary prevented normal toric varieties assigned
			 to global variables from being printed out as the name of the variable."
			 }
		    }
	       },
     	  LI { "new packages:",
     	       UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { TO "DiffAlg::DiffAlg", ", a package by Manuel Dubinsky, Cesar Massri, Ariel Molinuevo, and Federico Quallbrunn, for computations with differential forms, has been added." },
	       	    LI { TO "Quasidegrees::Quasidegrees", ", a package by Roberto Barrera for computing quasidegrees and graded local cohomology, has been added." },
		    LI { TO "DeterminantalRepresentations::DeterminantalRepresentations", ", a package by Justin Chen and Papri Dey for computing determinantal representations, has been added." },
		    LI { TO "FGLM::FGLM", ", a package by Dylan Peifer and Mahrud Sayrafi for computing Gröbner bases via the algorithm of Faugère, Gianni, Lazard, and Mora, has been added." }
		    }
	       },
     	  LI { "packages that have been published and certified:",
     	       UL {
     	       	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
		    LI { star, " ", TO "LieTypes::LieTypes", " and ", TO "ConformalBlocks::ConformalBlocks", ", two packages by Dave Swinarski for computing ranks and first Chern classes of conformal block bundles
			 on the moduli space of n-pointed curves of genus 0, have been published." },
		    LI { star, " ", TO "Divisor::Divisor", ", a package by Karl Schwede and Zhaoning Yang for working with Weil divisors, has been published." },
		    LI { star, " ", TO "StronglyStableIdeals::StronglyStableIdeals", ", a package by Davide Alberelli and Paolo Lella for studying strongly stable ideals related to Hilbert polynomials, has been published." },
		    LI { star, " ", TO "DiffAlg::DiffAlg", ", a package by Manuel Dubinsky, Cesar Massri, Ariel Molinuevo, and Federico Quallbrunn, for computations with differential forms, has been published." },
		    LI { star, " ", TO "Matroids::Matroids", ", a package by Justin Chen for computations with matroids, has been published." },
		    LI { star, " ", TO "Quasidegrees::Quasidegrees", ", a package by Roberto Barrera for computing quasidegrees and graded local cohomology, has been published." }
		    }
	       },
	  LI { "improved packages:",
	       UL {
		    LI { 
		       	 TO "ReflexivePolytopesDB::ReflexivePolytopesDB", " now has a simplified interface and also 
                         does not access the web during installation.  However, these changes will likely break previous code."
			 },
		    LI { 
		       	 TO "CohomCalg::CohomCalg", " also has a simplified interface and also 
                         does not access the web during installation.  However, these changes will likely break previous code
                         using this package."
			 }
		    }
	       },
	  LI { "new constants and operators:",		    -- get this with : git diff version-1.13 ../../m2/exports.m2
	       UL {
		    LI { "The symbol ", TT "Jupyter", " has been added." },
		    LI { "The type ", TO "MultigradedBettiTally", " has been added." },
		    LI { "The function ", TO "multigraded", " has been added." }
		    }
	       },
	  LI {
	       "commits, issues, and pull requests on github",
	       UL {
		    LI {
			 "See ", HREF{"https://github.com/Macaulay2/M2/issues?q=milestone%3A%22version+1.14%22+is%3Aclosed","closed 1.14 issues"}, ",
			 for the issues and pull requests incorporated into 1.14."
			 },
		    LI {
			 "See ", HREF{"https://github.com/Macaulay2/M2/commits/release-1.14","1.14 commits"}, " for complete information
			 about all changes to the code incorporated into 1.14."
			 }
		    }
	       }	  
	  }
     }

document {
     Key => "changes, 1.13",
     UL {
     	  LI { "functionality changed in a way that could break code:",
               UL {
		    LI { "Various packages have been preloaded for convenience when starting Macaulay2, but now they are no longer visible by
			 default inside the source code of a package.  Developers of packages should add the names of the needed preloaded packages
			 to the value of the ", TO [newPackage, PackageImports], " or ", TO [newPackage, PackageExports], " option, to ensure that needed definitions are visible." },
                    LI { "the Schubert2 functions ", TT "projectiveSpace", " and ", TT "projectiveSpace'", "have been renamed ", TO "Schubert2::abstractProjectiveSpace", "  and ",
                     	 TO "Schubert2::abstractProjectiveSpace'", ".  The reason is that there were name conflicts with the ", TO "NormalToricVarieties::NormalToricVarieties", " package.  
			 Since ", TT "PP", " is no longer protected, you may put ", TT "PP = abstractProjectiveSpace", 
                     	 " in your init file and then use something like ", TT "X = PP 4", ", although ", TT "PP^4", " will no longer work." },
		    LI { "The deprecated old-style block comment syntax has been disabled.  Now one types ", TT "-* COMMENT *-", " instead of ", TT "{* COMMENT *}", "." } } },
     	  LI { "new packages:",
     	       UL {
	       	    LI { TO "Truncations::Truncations", ", a package by David Eisenbud and Mike Stillman for truncating modules, has been added.
			 It implements a better notion of truncation of a multigraded module.  Some bugs in the old function have been fixed.  
			 The function ", TO "Truncations::truncate(List,Module)", " has been made functorial, but it no longer allows partial degrees to be given." },
	       	    LI { TO "FrobeniusThresholds::FrobeniusThresholds", ", a package by Erin Bela, Alberto F. Boix, Juliette Bruce, Drew Ellingson, Daniel Hernandez,
			 Zhibek Kadyrsizova, Moty Katzman, Sara Malec, Matthew Mastroeni, Maral Mostafazadehfard, Marcus Robinson, Karl Schwede, Dan 
			 Smolkin, Pedro Teixeira and Emily Witt for calculation of Frobenious thresholds, has been added." },
	       	    LI { TO "ToricInvariants::ToricInvariants", ", a package by Martin Helmer for computing Euclidean distance degrees, polar degrees,
			 degree and codimension of the dual, and Chern-Mather classes of toric varieties, has been added." },
	       	    LI { TO "SegreClasses::SegreClasses", ", a package by Martin Helmer and Corey Harris for testing containment of varieties and 
			 computing algebraic multiplicity of subvarieties and Fulton-MacPherson intersection products, has been added." },
	       	    LI { TO "SemidefiniteProgramming::SemidefiniteProgramming", ", a package by Diego Cifuentes, Thomas Kahle, Pablo A. 
			 Parrilo, and Helfried Peyrl for semidefinite programming, has been added." },
	       	    LI { TO "SumsOfSquares::SumsOfSquares", ", a package by Diego Cifuentes, Thomas Kahle, Pablo A. Parrilo,
			 and Helfried Peyrl for sums of squares, has been added." },
	       	    LI { TO "MultiGradedRationalMap::MultiGradedRationalMap", ", a package by Yairon Cid Ruiz for computing the degree
			 and birationality of multigraded rational maps, has been added." 
			 }
		    }
	       },
	  LI { "improved packages:",
	       UL {
		    LI { 
		       	 TO "CompleteIntersectionResolutions::CompleteIntersectionResolutions", " now has a full implementation of the Eisenbud-Shamash resolution, and
		       	 using ", TO "MCMApproximations::MCMApproximations", ", now can compute the layered resolution of any Cohen-Macaulay module, not just a high syzygy." 
			 }
		    }
	       },
	  LI { "new constants and operators:",		    -- get this with : git diff version-1.9.2 ../../m2/exports.m2
	       UL {
		    LI { "The type ", TO "Describe", ", ", TO "MapExpression", ", ", TT "MatrixDegreeExpression", ", ", TT "SheafExpression", ", and ", TO "VectorExpression", "
			 have been added." },
		    LI { "The top level mode ", TO "WebApp", " has been added." },
		    LI { "The function ", TT "htmlWithTex", " has been added." },
		    LI { "The function ", TO "polarize", " has been added." }
		    }
	       }
          } 
     }

document {
     Key => "changes, 1.12",
     UL {
     	  LI { "new packages:",
     	       UL {
	       	    LI { TO "Seminormalization::Seminormalization", ", a package by Bernard Serbinowski and Karl Schwede for computing seminormalization of rings, has been added." },
	       	    LI { TO "CoincidentRootLoci::CoincidentRootLoci", ", a package by M. C. Brambilla and G. Staglianò for computations with coincident root loci, has been added." },
	       	    LI { TO "RelativeCanonicalResolution::RelativeCanonicalResolution", TEX ", a package by Christian Bopp and Michael Hoff for computation of the relative canonical resolution for g-nodal canonical curves with a fixed $g^1_k$, has been added." },
		    LI { TO "RandomCurvesOverVerySmallFiniteFields::RandomCurvesOverVerySmallFiniteFields", TEX ", a package by Christian Bopp and Frank-Olaf Schreyer for computation of general canonical curves of genus $\\le 15$ over fields with small characteristic, has been added." },
	       	    LI { TO "StronglyStableIdeals::StronglyStableIdeals", ", a package by Davide Alberelli and Paolo Lella for studying strongly stable ideals related to Hilbert polynomials, has been added." },
	       	    LI { TO "SLnEquivariantMatrices::SLnEquivariantMatrices", ", a package by Ada Boralevi, Daniele Faenzi and Paolo Lella for computations related to the paper \"A construction of equivariant bundles on the space of symmetric forms\", has been added." },
		    LI { TO "CorrespondenceScrolls::CorrespondenceScrolls", ", a package by David Eisenbud, Frank-Olaf Schreyer, and Alessio Sammartano, to compute and analyze examples of correspondence scrolls, has been added." },
		    LI { TO "NCAlgebra::NCAlgebra", ", a package by Frank Moore, Andrew Conner, and Courtney Gibbons, implementing data types for noncommutative algebras, has been added." },
		    LI { TO "SpaceCurves::SpaceCurves", ", a package by Frank Schreyer, Mike Stillman, and Mengyuan Zhang, for generation of space curves, has been added." },
     	       	    LI { TO "ExteriorIdeals::ExteriorIdeals", ", a package by Marilena Crupi and Luca Amata for manipulating monomial ideals over exterior algebras, has been added." }
		    }
	       },
     	  LI { "packages that have been published and certified:",
     	       UL {
     	       	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
		    LI { star, " ", TO "Resultants::Resultants", ", a package by Giovanni Staglianò for resultants and discriminants for multivariate polynomials, has been published." },
		    LI { star, " ", TO "SpaceCurves::SpaceCurves", ", a package by Frank Schreyer, Mike Stillman, and Mengyuan Zhang, for generation of space curves, has been published." },
     	       	    LI { star, " ", TO "ReesAlgebra::ReesAlgebra", ", a package by David Eisenbud, Amelia Taylor, and Sorin Popescu for computations with Rees algebras, has been published." },
     	       	    LI { star, " ", TO "Cremona::Cremona", ", a package by Giovanni Staglianò for computations for rational maps between projective varieties, has been published." },
     	       	    LI { star, " ", TO "ExteriorIdeals::ExteriorIdeals", ", a package by Marilena Crupi and Luca Amata for manipulating monomial ideals over exterior algebras, has been published." }
     	       	    }
     	       },
     	  LI { "improved packages:",
     	       UL {
		    LI {
			 "The package ", TO "VersalDeformations::VersalDeformations", " has had a
			 bug fixed.  The lifting algorithm would give an error or incorrect output
			 if the tangent cone for the obstruction equations wasn't generated by the
			 lowest order terms of the obstruction equations. This has been remedied by
			 actually calculating the tangent cone, and making appropriate adjustments
			 to the algorithm."
			 },
		    LI {
			 "The package ", TO "TateOnProducts::TateOnProducts", " has been improved.  The
			 package implements the method of Tate resolutions, for computing cohomology of sheaves
			 on products of projective spaces, and also the pushforward complex of a sheaf under a
			 map from a variety to a projective space. Tate resolutions on single projective spaces
			 were treated in the package ", TO "BGG::BGG", ", but the case of a product of projective spaces is
			 much more subtle, since no term of the full Tate resolution is finitely generated."
			 }
		    }
	       },
	  LI { "functionality added or improved:",
	       UL {
		    LI {
			 "The function ", TO "about", " has been added.  It allows one to search the documentation of all the
			 packages that have been installed, optionally searching the contents, in addition to the keys.
			 For example, the command ", TT "help about X", " will display all the documentation about ", TT "X", "."
			 },
		    LI {
			 "The class ", TO "NumberedVerticalList", " has been added.  It's a new type of vertical list (see ", TO "VerticalList", ")
			 that is also printed vertically, but with numbered entries, for ease of referring to them."
			 },
		    LI {
			 "The option ", TT "AbsoluteLinks", " to ", TO "installPackage", " has been removed.  Better logic
			 is now used internally, producing relative links only between files installed under the same prefix."
			 },
		    LI {
			 "The layout of files into directories used by ", TO "installPackage", " has been simplified, so it may be
			 a good idea to reinstall any packages you have installed.  See ", TO "Layout", "."
			 },
		    LI {
			 "Each directory listed in ", TO "prefixPath", " now has its own layout, which is detected at runtime.
			 See ", TO "Layout", "."
			 },
		    LI {
			 "Functionality for fast nonminimal free resolutions, ", TO "OldChainComplexes :: FastNonminimal", " has a number of bug fixes and
			 improvements: (1) it now works for input modules, not just ideals (there was a monomial order mismatch which
			     would often cause it to fail), (2) multigraded and inhomogeneous ideals/modules are allowed, 
			 (3) this function works over the exterior algebra as well (it has always done so, but that was not
			     always realized), (4) it is possible to have M2 use an already created Gröbner basis, instead of recomputing
			 one.  Use Strategy=>5 in the ", TO "OldChainComplexes :: resolution", " command, to tell the command that the
			 provided ideal has generators which already form a Gröbner basis, not necessarily a reduced
			 Gröbner basis, or a quotient module, whose presentation matrix forms a Gröbner basis.
			 If the input is not, then this function can give incorrect answers or fail.  See ",
			 TO "OldChainComplexes :: FastNonminimal", " for details and examples."
			 },
		    LI {
			 "New types ", TO "MethodFunctionSingle", " and ", TO "MethodFunctionBinary", " were introduced to serve as classes of
			 method functions with a single argument, such as ", TO "code", ", and of associative method functions based on methods
			 with two arguments, such as ", TO "gcd", ", from other compiled functions."
			 },
		    LI {
			 "We have removed the feature where typing an extra empty line ends multiline 
			 input in a terminal window or Emacs buffer.
			 This will make it easier to feed input from a file into the interpreter with
			 F-11 and encounter the same behavior, since in files we have permit empty lines.
			 This change was requested at our Leipzig workshop, with Q2 at ",
			 HREF {"https://github.com/Macaulay2/Workshop-2018-Leipzig/wiki/Q&amp;A-Thursday",
			       "https://github.com/Macaulay2/Workshop-2018-Leipzig/wiki/Q&A-Thursday"},
			 " being the question that prompted the discussion."
			 }
		    }
	       },
	  LI {
	       "commits, issues, and pull requests on github",
	       UL {
		    LI {
			 "See ", HREF{"https://github.com/Macaulay2/M2/issues?q=milestone%3A%22version+1.12%22+is%3Aclosed","closed 1.12 issues"}, ",
			 for the issues and pull requests incorporated into 1.12."
			 },
		    LI {
			 "See ", HREF{"https://github.com/Macaulay2/M2/commits/release-1.12","1.12 commits"}, " for complete information
			 about all changes to the code incorporated into 1.12."
			 }
		    }
	       }
	  }
     }

document {
     Key => "changes, 1.11",
     UL {
     -- 	  LI { "major improvements and additions:",
     -- 	        UL {
     -- 	            }
     --        },
     -- 	  LI { "packages that have been published and certified:",
     -- 	       UL {
     -- 	       	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
     -- 	       	    }
     -- 	       },
     	  LI { "new packages:",                       -- got this with git diff version-1.10 =distributed-packages; see also the helper code in README
     	       UL {
	       	    LI { TO "AbstractToricVarieties::AbstractToricVarieties", ", a package by Mike Stillman for linking abstract simplicial (normal) toric varieties to Schubert2, has been added." },
	       	    LI { TO "AlgebraicSplines::AlgebraicSplines", ", a package by Gwyn Whieldon, Eliana Duarte, Daniel Irving Bernstein, and Daniel Irving Bernstein for splines on simplicial complexes, polytopal complexes, and graphs, has been added." },
	       	    LI { TO "Chordal::Chordal", ", a package by Diego Cifuentes and Pablo Parrilo for exploiting chordal structure, has been added." },
	       	    LI { TO "CohomCalg::CohomCalg", ", a package by Mike Stillman for providing an interface to CohomCalg software for computing cohomology of torus invariant divisors on a toric variety, has been added." },
	       	    LI { TO "Complexes::Complexes", ", a package by Gregory G. Smith and Mike Stillman for chain complexes, has been added." },
		    LI { TO "GroebnerWalk::GroebnerWalk", ", a package by Dylan Peifer for computing Gröbner bases via the Gröbner walk, has been added." },
	       	    LI { TO "Matroids::Matroids", ", a package by Justin Chen for computations with matroids, has been added." },
		    LI { TO "NonminimalComplexes::NonminimalComplexes", ", a package by Frank Schreyer and Mike Stillman for obtaining the non-minimal strands of a non-minimal resolution of a homogeneous module, has been added." },
	       	    LI { TO "NumericalImplicitization::NumericalImplicitization", ", a package by Justin Chen and Joe Kileel for computing invariants of images of polynomial maps, has been added." },
	       	    LI { TO "PruneComplex::PruneComplex", ", a package by Mahrud Sayrafi and Mike Stillman for pruning chain complexes over polynomial and local rings, has been added." },
	       	    LI { TO "RandomMonomialIdeals::RandomMonomialIdeals", ", a package by Despina Stasi, Dane Wilburne, Tanner Zielinski, Daniel Kosmas, Parker Joncus, Richard Osborn, Monica Yun, and Genevieve Hummel for generating Erdos-Renyi-type random monomial ideals, has been added." },
	       	    LI { TO "ReflexivePolytopesDB::ReflexivePolytopesDB", ", a package by Mike Stillman for simple access to Kreuzer-Skarke database of reflexive polytopes of dimensions 3 and 4, has been added." },
	       	    LI { TO "SymbolicPowers::SymbolicPowers", ", a package by Eloisa Grifo for calculations involving symbolic powers, has been added." },
	       	    LI { TO "TestIdeals::TestIdeals", ", a package by Alberto F. Boix, Juliette Bruce, Drew Ellingson, Daniel Hernandez, Zhibek Kadyrsizova, Mordechai Katzman, Sara Malec, Matthew Mastroeni, Maral Mostafazadehfard, Marcus Robinson, Karl Schwede, Dan Smolkin, Pedro Teixeira, and Emily Witt for calculations of singularities in positive characteristic, has been added." },
	       	    LI { TO "Topcom::Topcom", ", a package by Mike Stillman that provides an interface to a small part of topcom, has been added." },
	       	    LI { TO "TriangularSets::TriangularSets", ", a package by Diego Cifuentes for triangular decomposition of ideals, has been added." },
	       	    LI { TO "Tropical::Tropical", ", a package by Kathlen Kohn, Sara Lamboglia, Diane Maclagan, Benjamin Smith, Jeff Sommars, Paolo Tripoli, Magdalena Zajaczkowska, and Magdalena Zajaczkowska for computations in tropical geometry, has been added." },
     	       	    -- LI { TO "::", ", a package by ... for ..., has been added." },
     	       } },
     	  LI { "improved packages:",
     	       UL {
		    LI {
			 "The package ", TO "CompleteIntersectionResolutions::CompleteIntersectionResolutions", " includes now the
			analysis of resolutions over complete intersections,
			and computations of the special resolutions of modules
			over complete intersections that were described by
			Eisenbud and Peeva in various papers."
			},
		   LI {
			"The package ", TO "ReesAlgebra::ReesAlgebra", " has been improved:
			Corrected and completed the documentation and cleaned
			up code; added functionality having to do with options
			for computing saturation (used in the basic routines);
			added functionality of the 'Jacobian dual' method. Submitted JSAG article explaining the package."
			},
		   LI {
			"The package ", TO "K3Carpets::K3Carpets", " includes now
     	       	    	facilities for computing with K3carpets and their
     	       	    	generalization, the correspondence scrolls, and using
     	       	    	the Schreyer resolution and Schreyer naming of syzygies
     	       	    	to determine in which characteristics they have
     	       	    	behavior other than that corresponding to Green's
     	       	    	conjecture. The computations are used in a forthcoming
     	       	    	preprint by Eisenbud and Schreyer."
			},
     	       	    LI {
			TO "LocalRings::LocalRings", " has been rewritten by Mahrud Sayrafi and Mike Stillman. Functions from the old version are still available.
			The new package extends various primary functions to work over local rings with respect to prime ideals.
			These functions include syz, res, trim, mingens, minimalPresentation, symbol //, inducedMap, symbol :, saturate, annihilate.
			The function hilbertSamuelFunction for modules over local rings, optionally given a parameter ideal, has been added." },
     	       	    LI {
			 TO "Cremona::Cremona", " has been updated from version 3.9.1 to version 4.2.
			    The class 'RationalMap' has been improved; in particular, this affects the way how the objects of the class are displayed.
			    Support has been added for rational maps whose source is a subvariety of a product of projective spaces.
			    For instance 'graph(RationalMap)' returns a pair of such maps.
			    'composeRationalMap(rationalMap,RationalMap)' has been replaced by 'rationalMap * RationalMap'
			    'invertBirMap' has been replaced by 'inverseMap'
			    'kernelComponent(RingMap,ZZ)' has been replaced by 'kernel(RingMap,ZZ)'" },
     	       	    LI {
			 TO "Resultants::Resultants", " has been updated from version 1.0 to 1.2.
			    'CayleyTrick' has been changed and replaced by 'cayleyTrick'
			    'ChowEquations' has been replaced by 'chowEquations'
			    'ChowForm' has been replaced by 'chowForm'
			    'Discriminant' has been replaced by 'discriminant'
			    'Dual' has been replaced by 'dualVariety'
			    'Resultant' has been replaced by 'resultant'
			    'Xresultant(Ideal)' has been removed: use 'fromPluckerToStiefel dualize ChowForm I' instead
			    The methods 'affineDiscriminant', 'affineResultant', 'hurwitzForm', 'macaulayFormula' has bees added." 
			    },
     	       	    LI {
				"The package ", TO "TorAlgebra::TorAlgebra", " replaces the package ", TT "CodepthThree", ". 
				In addition to the functionality
				of CodepthThree, the new package now also implements the classification scheme
				(due to Kustin and Miller) for Gorenstein rings of codepth 4. Moreover, the
				package recognizes complete intersection, Gorenstein, and Golod rings of any
				codepth via the functions isCI, isGorenstein, and isGolod." },
		    LI {
			 "The package ", TO "Divisor::Divisor", " has numerous changes to core methods to
			 make them compatible with Macaulay2 standards and conventions (including renaming many methods).
			 Documentation is also improved throughout.  Additional
			 functionality has also been added (for example, checking if a divisor is very ample)."
     	  	    }
     	       }},     
     	  LI { "functionality added or improved:",
     	       UL {
		    LI { "The function ", TO "LocalRings :: localRing", ", for localizing a polynomial ring at a prime ideal, has been added." },
		    LI { "The function ", TO (length, Module), " now can compute length of Artinian modules over local rings." },
		    LI {
			 "The function ", TO "newPackage", " now takes two new options: 
			 ", TT "OptionalComponentsPresent", " tells whether all optional external components of the package are present on the system,
			 and ", TT "UseCachedExampleOutput", " tells whether to use the cached example output files.  This will be useful for packages
			 that use external programs that are not always present, so they can seize the opportunity to rerun examples when the external
			 programs are present and give no error when the external programs are absent."
			 }
     	  	   }
     	       },
     -- 	  LI { "new constants and operators:",		    -- get this with : git diff version-1.9.2 ../../m2/exports.m2
     -- 	       UL {
     -- 	       	    }
     -- 	       },
     	  LI { "functionality changed:",
     	       UL {
     	       	    LI {
			 "The format for multi-line (un-nested) block comments has been changed from ", TT "{* ... *}", " to ", TT "-* ... *-", " so Emacs can colorize
			 the comments correctly.  The (deprecated) old style will be recognized by M2 for a while."
			 }
		    }
               }
     	  }
     }

document {
     Key => "changes, 1.10",
     UL {
	  -- LI { "major improvements and additions:",
	  --       -- UL {
	  --       --     }
          --   },
	  -- LI { "packages that have been published and certified:",
	  --      -- UL {
	  --      -- 	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
	  --      -- 	    }
	  --      },
	  LI { "new packages:",                       -- got this with git diff version-1.9.2 =distributed-packages 
	       UL {
	       	    -- LI { TO "::", ", a package by ... for ..., has been added." },
	       	    LI { TO "SpectralSequences::SpectralSequences", ", a package by Adam Boocher, Nathan Grieve, Eloisa Grifo, Gregory G. Smith, and Thanh Vu for spectral sequences, has been added." },
	       	    LI { TO "SectionRing::SectionRing", ", a package by Andrew Bydlon for computing the section ring of a Weil Divisor., has been added." },
	       	    LI { TO "K3Carpets::K3Carpets", ", a package by David Eisenbud, Frank-Olaf Schreyer for K3 double structure on scrolls, has been added." },
	       	    LI { TO "ChainComplexOperations::ChainComplexOperations", ", a package by David Eisenbud for sym2, wedge2, chi2 of a ChainComplex, has been added." },
	       	    LI { TO "NumericalCertification::NumericalCertification", ", a package by Kisun Lee for testing NumericalAlgebraicGeometry, has been added." },
	       	    LI { TO "PhylogeneticTrees::PhylogeneticTrees", ", a package by Nathaniel Bushek, Ruth Davidson, Elizabeth Gross, Pamela Harris, Robert Krone, Colby Long, AJ Stewart, Robert Walker, and Robert Walker for invariants for group-based phylogenetic models, has been added." },
	       	    LI { TO "MonodromySolver::MonodromySolver", ", a package by Cvetelina Hill, Anders Nedergaard Jensen, Kisun Lee, Anton Leykin, and Jeff Sommars for solving polynomial systems via monodromy, has been added." },
	       	    LI { TO "ReactionNetworks::ReactionNetworks", ", a package by Timothy Duff, Kisun Lee, and Anton Leykin for reaction networks, has been added." },
	       	    LI { TO "PackageCitations::PackageCitations", ", a package by Aaron Dall for citation of Macaulay2 packages, has been added." },
	       	    LI { TO "NumericSolutions::NumericSolutions", ", a package by Corrado Possieri, and Antonio Tornambe for solving systems of polynomial equalities, has been added." },
	       	    LI { TO "GradedLieAlgebras::GradedLieAlgebras", ", a package by Clas Löfwall and Samuel Lundqvist for computations in graded Lie algebras, has been added." },
	       	    LI { TO "InverseSystems::InverseSystems", ", a package by David Eisenbud for equivariant Macaulay inverse systems, has been added." },
	       	    LI { TO "Pullback::Pullback", ", a package by Drew Ellingson and Karl Schwede for pullback of rings, has been added." },
	       	    LI { TO "EngineTests::EngineTests", ", a package by Michael E. Stillman and Jakob Kroeker for a test suite for the Macaulay2 engine, has been added." },
	       	    LI { TO "SVDComplexes::SVDComplexes", ", a package by Frank Schreyer and Mike Stillman for SVD of a complex, including nonminimal resolutions over the reals, has been added." },
	       	    LI { TO "RandomComplexes::RandomComplexes", ", a package by Frank Schreyer and Mike Stillman for random complexes over fields or the integers, has been added." }
	       } },
	  LI { "improved packages:",
	       UL {
		    { TO "Polyhedra::Polyhedra", " has been rewritten by Lars Kastner for improved performance.  Many bugs have been fixed, 
		       	 and there are now a large number of tests.
		       	 Some changes are not backward compatible.  Some changes include: ",
		       	 UL {
			      LI { TO "Polyhedra::Fan", ", is no longer a collection of Cone objects, but contains a matrix of rays (over ZZ),
			     	   and a list of lists of integer indices, indicating the maximal cones.  Well-defined-ness is no longer 
				   automatically checked.  Use ", TO "Polyhedra::isWellDefined(Fan)"},
			 	   LI { TO "Polyhedra::Polyhedron", ", is now a wrapper for the homogenized cone."},
			 	   LI { TO "Polyhedra::PolyhedralComplex", ", is now a wrapper for the homogenized fan."},
			 	   LI { TO "Polyhedra::Cone", ", has basically the same functionality, except that not everything is computed ahead of time."},
			 	   LI { TO "Polyhedra::faces", ", now returns a list of lists of integer indices.  There are two new functions
			     		for recovering the old behavior: ", TO "Polyhedra::facesAsCones", " (for fans and cones), and  ", TO "Polyhedra::facesAsPolyhedra", 
			     		" for polyhedra and polyhedral complexes." }
			   	   },
		       	      "An important difference is that objects of these classes can no longer be used as keys into hash tables, since these objects
		       	      are implemented as mutable hash tables. In particular ", TO symbol===, " no longer works on cones.  Instead, use
		       	      a sorted list of e.g. vertices and lineality space.",
		       	      PARA{"If you need the old behavior, load the package ", TO "OldPolyhedra::OldPolyhedra", ". 
		       		   However, if possible, change your code to run with the new package."}
		       		   }
	       		      }
         		 },     
	  LI { "functionality added or improved:",
	       UL {
		    LI { "The functions ", TO "InverseSystems::toDual", " and ", TO "InverseSystems::fromDual", " have been improved and moved to the new package ", TO "InverseSystems::InverseSystems",
			 ": they are now compatible with linear changes of coordinates." }
	  	   }
	       },
	  LI { "new constants and operators:",		    -- get this with : git diff version-1.9.2 ../../m2/exports.m2
	       UL {
		    LI { "The function ", TO "QRDecomposition", " has been added." },
		    LI { "The function ", TO "isFinitePrimeField", " has been added." },
		    LI { "The function ", TO "isWeylAlgebra", " has been added." }
	       	    }
	       },
	  -- LI { "functionality changed:",
	  --      UL {
	  -- 	       }
          --      }
    	  -- }
	  }
     }


document {
     Key => "changes, 1.9.2",
     UL {
	  -- LI { "major improvements and additions:",
	  --       -- UL {
	  --       --     }
          --   },
	  -- LI { "packages that have been published and certified:",
	  --      -- UL {
	  --      -- 	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
	  --      -- 	    }
	  --      },
	  LI { "new packages:",                       -- got this with git diff version-1.8.2 =distributed-packages 
	       UL {
		    LI { TO "RationalMaps::RationalMaps", ", a package by Karl Schwede, Daniel Smolkin, S. Hamid Hassanzadeh, and C. J. Bott, for working with rational maps, has been added." }
	       	    -- LI { TO "::", ", a package by ... for ..., has been added." },
	       	    }
	       },
	  -- LI { "improved packages:",
	  --     -- UL {
	  --     -- 	  }
	  --     },
	  LI { "functionality added or improved:",
	       UL {
		   LI { "The generation of the documentation in HTML format has been improved, and
			validity is now verified overnight automatically." }
		   }
	       },
	  -- LI { "new constants and operators:",		    -- get this with : git diff version-1.8.2 ../../m2/exports.m2
	  --      -- UL {
	  --      -- 	    }
	  --      },
	  -- LI { "functionality changed:",
	  --      UL {
	  -- 	       }
          --      }
    	  }
     }

document {
     Key => "changes, 1.9.1",
     UL {
	  -- LI { "major improvements and additions:",
	  --       -- UL {
	  --       --     }
          --   },
	  -- LI { "packages that have been published and certified:",
	  --      -- UL {
	  --      -- 	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
	  --      -- 	    }
	  --      },
	  LI { "new packages:",                       -- got this with git diff version-1.8.2 =distributed-packages 
	       UL {
	       	    LI { TO "ResidualIntersections::ResidualIntersections", ", a package by Katie Ansaldi, David Eisenbud, Robert Krone, and Jay Yang, for studying conditions associated to residual intersection theory, has been added." },
	       	    LI { TO "Visualize::Visualize", ", a package by Brett Barwick, Thomas Enkosky, Branden Stone, and Jim Vallandingham, to help visualize algebraic objects in the browser using javascript, has been added." },
		    LI { TO "EquivariantGB::EquivariantGB", ", a package by Chris Hillar, Robert Krone, and Anton Leykin for equivariant Gröbner bases and related algorithms, has been added." },
		    LI { TO "ExampleSystems::ExampleSystems", ", a package by Anton Leykin for examples of polynomial systems in numerical algebraic geometry, has been added." }
	       	    -- LI { TO "::", ", a package by ... for ..., has been added." },
	       	    }
	       },
	  -- LI { "improved packages:",
	  --     -- UL {
	  --     -- 	  }
	  --     },
	  LI { "functionality added or improved:",		    -- get this with : git diff version-1.8.2 ../../m2/exports.m2
	       UL {
		   LI { "The new function ", TO minimalBetti, " finds minimal Betti numbers of an ideal or module
		       using the new ", TO "OldChainComplexes :: FastNonminimal", " functionality, avoiding unneeded computation of matrices in the
		       free resolution."},
		   LI { "The new function ", TO "roots", ", provided by Guillem Blanco, finds roots of univariate polynomials numerically." },
		   LI { "the new function ", TO "splitWWW", " takes an http response, e.g. from ", TO "getWWW", " and unpacks it into
		       the header, and the body.  Additionally, if the response indicates that this is a chunked response,
		       then the body is unchunked (should be considered a bug fix from previous functionality)." }
			   }
	       },
	  -- LI { "new constants and operators:",
	  --      -- UL {
	  --      -- 	    }
	  --      },
	  LI { "functionality changed:",
	       UL {
		   LI { "Some linear algebra functions, including ", TO LUdecomposition, ", ", TO "solve", ", ", TO "nullSpace", ", and  ", TO "columnRankProfile", ", ",
		       " when presented with matrices over ", TO "ZZ", " would previously give occasional nonsensical answers.  These functions have been
		       disabled for matrices over ", TO "ZZ", ".  However, ", TO "solve", " uses Gröbner basis methods to solve a linear system, so did not suffer this problem.
		       Caveat: using these functions with a ring that is not a field, even if it runs, might give a nonsensical answer.
		       This will be cleaned up in a later version."
		       }
               }
	       }
    	  }
     }

document {
     Key => "changes, 1.9",
     UL {
	  LI { "major improvements and additions:",
	        UL {
                LI { "Fast minimal betti number and non-minimal resolution code, for homogeneous ideals and modules over 
                    polynomial rings over finite prime fields.  Also is functional for ideals and
                    modules over exterior algebras.  See ", TO "OldChainComplexes :: FastNonminimal", " and ", TO "OldChainComplexes :: betti(...,Minimize=>...)", ".  For
                    computing minimal betti numbers, on larger examples, this code is often hundreds to thousands of times faster than 
                    standard use of ", TO "resolution", " and is also, in many cases, much faster than the 
                    similar code in Singular version 4.0.2 described in Erocal, Motsak, Schreyer, Steenpass, Refined Algorithms to
                    compute syzygies, arxiv 1502.01654.  A paper describing our algorithm and implementation is forthcoming."
                    }
	            }
            },
	  LI { "packages that have been published and certified:",
	       UL {
	  	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
		    LI { star, " ", TO "HighestWeights::HighestWeights", ", a package by Federico Galetto for decomposing free resolutions and graded modules with a semisimple Lie group action, has been published." },
		    LI { star, " ", TO "Posets::Posets", ", a package by David Cook II, Sonja Mapes, and Gwyn Whieldon, for processing partially ordered sets, has been published." },
		    LI { star, " ", TO "MultiplierIdeals::MultiplierIdeals", ", a package by Zach Teitler for computing multiplier ideals of monomial ideals, has been published." },
		    LI { star, " ", TO "CharacteristicClasses::CharacteristicClasses", ", a package by Christine Jost and Martin Helmer for computing characteristic classes on toric varieties, has been published." }
	       	    }
	       },
	  LI { "new packages:",                       -- got this with git diff version-1.8.2 =distributed-packages 
	       UL {
	  	    -- LI { TO "::", ", a package by ... for ..., has been added." },
	  	    LI { TO "MCMApproximations::MCMApproximations", ", a package by David Eisenbud for maximal Cohen-Macaulay approximations and complete intersections, has been added." },
	  	    LI { TO "MultiplierIdealsDim2::MultiplierIdealsDim2", ", a package by Ferran Dachs-Cadefau for computing multiplier ideals in 2-dimensional rings, has been added." },
	  	    LI { TO "RunExternalM2::RunExternalM2", ", a package by Brian Pike for running Macaulay2 functions outside the current Macaulay2 process, has been added." },
	  	    LI { TO "SLPexpressions::SLPexpressions", ", a package by Anton Leykin for straight line programs and algebraic circuits, has been added." },
	  	    LI { TO "NumericalSchubertCalculus::NumericalSchubertCalculus", ", a package by Anton Leykin, Abraham Martin del Campo, and Jan Verschelde, for numerical methods in Schubert Calculus, has been added." },
	  	    LI { TO "ToricTopology::ToricTopology", ", a package by Alvise Trevisan and Alexander I. Suciu for toric topology, has been added." },
	  	    LI { TO "Cremona::Cremona", ", a package by Giovanni Staglianò for rational maps between projective varieties, has been added." },
	  	    LI { TO "Resultants::Resultants", ", a package by Giovanni Staglianò for resultants and discriminants for multivariate polynomials, has been added (originally called ", TT "MultipolynomialResultants", ")." },
	  	    LI { TO "VectorFields::VectorFields", ", a package by Brian Pike for vector fields, has been added." },
	  	    LI { TO "RandomIdeals::RandomIdeals", ", a package by David Eisenbud for creating random ideals of various sorts, has been added." },
	  	    LI { TO "Miura::Miura", ", a package by Joe Suzuki for divisor class groups on curves, has been added." }
	  	    }
	       },
	  -- LI { "improved packages:",
	  --     UL {
	  -- 	  LI { "The package ", TO "NumericalAlgebraicGeometry", " implements a version of adaptive precision homotopy continuation tracker
	  -- 	      that is now used by default in the black-box solver (", TO "NumericalAlgebraicGeometry::solveSystem", ")." },
	  -- 	  }
	  --     },
	  LI { "functionality added or improved:",		    -- get this with : git diff version-1.8.2 ../../m2/exports.m2
	       UL {
		    LI { "The new function ", TO "installedPackages", " returns a list of names of packages installed by the user with ", TO "installPackage", "." },
     	       	    LI { "The new function ", TO "uninstallAllPackages", " uninstalls all the packages installed by the user with ", TO "installPackage", "." }
		    }
	       },
	  -- LI { "new constants and operators:",
	  --      UL {
	  --      	    }
	  --      }
	  -- LI { "functionality changed:",
	  --      UL {
	  --      	    }
	  --      },
      LI { "useful functions involving prime numbers, submitted by Frank Schreyer:",
          UL {
              LI { TO "nextPrime", ", a simple function to find the first prime number at least as large as a given number"},
              LI { TO "getPrimeWithRootOfUnity", ", used to find a prime number p s.t. ZZ/p contains a n-th root of unity"},
              LI { TO "randomKRationalPoint", ", a function to find a random rational point on a variety over a finite field"}
              }
      }
    }
  }

document {
     Key => "list of obsolete functions",
     UL {
          LI {
	       "obsolete classes",
	       UL {
		    LI { TT "Thread", " has been replaced by ", TO "Task" },
		    }
	       },
	  LI {
	       "obsolete functions",
	       UL {
		    LI { "'mutableZero' has been replaced by ", TO "mutableMatrix" },
		    LI { "'unlist' has been replaced by ", TO "toSequence" },
		    LI { "'evaluate' has been replaced by ", TO "value" },
		    LI { "'seq x' has been replaced by 'singleton x', which has been replaced by '1:x'" },
		    LI { "'verticalJoin' has been replaced by ", TO "stack" },
		    LI { "'netRows' has been replaced by ", TO "unstack" },
		    LI { "'name' has been replaced by ", TO "toString" },
		    LI { "'quote' has been replaced by ", TO "symbol" },
		    LI { "'Numeric' has been replaced by ", TO "numeric" },
		    LI { "'submodule' has been removed" },
		    LI { "'monomialCurve' has been replaced by ", TO "monomialCurveIdeal" },
		    LI { "'assign' has been replaced by ", TO "<-" },
		    LI { "'minprimes' has been replaced by ", TO "independentSets" },
		    LI { "'elapsedTime' has been renamed to ", TO "cpuTime" },
		    LI { "'pushForward1(f,M)' has been replaced by 'relations coimage map(M,f)'" },
		    LI { TT "adjoint1", " has been replaced by ", TO "adjoint'", ", whose interface is different" }
		    }
	       },
	  LI {
	       "obsolete methods",
	       UL {
		    LI { TT "Wikipedia(String)", " has been replaced: use ", TO "SimpleDoc :: wikipedia", " instead" },
		    LI { "'map(Ideal)' has been removed: use 'map(module I,module I, 1)' instead" },
		    LI { "'map(Ideal,Ideal)' has been removed: use 'map(module I,module J)' instead" },
		    LI { "'map(Module,Matrix)' has been replaced: use 'map(M,,f)' instead" },
		    LI { "'map(Module,RingElement)' has been removed: use 'map(M,M,r)' instead" },
		    LI { "'RingElement _ ZZ' has been replaced: use 'part(n,f)' instead" },
		    LI { "'RingElement _ List' has been replaced: use 'part(d,f)' instead" },
		    LI { "'diff(RingElement)' has been removed: use 'diff(vars ring f, f)' instead" },
		    LI { "'diff(Matrix)' has been removed: use 'diff(vars ring f, f)' instead" },
		    LI { "'map(Module,Module)' has been removed: use 'inducedMap' instead" },
		    LI { "'monomialIdeal(R)' has been removed: use 'monomialIdeal(0_R)' instead" }
		    }
	       }
	  }
     }

document {
     Key => "changes, 1.8.2",
     UL {
	  LI { "functionality added or improved:",
	       UL {
		    LI { 
			 "A problem with making finite fields using ", TO "GF", " was fixed.  It involved the third-party
			 FLINT number theory library not being able to find its file containing a list of Conway polynomials." }}}}}

 
document {
     Key => "changes, 1.8.1",
     UL {
	  LI { "functionality added or improved:",
	       UL {
		    LI { 
			 "The function ", TO "remainder", " was recently made more general (so the modules involved are not necessarily free),
			 but as a result, some Gröbner bases were no longer cached, necessitating frequent recomputation in certain examples,
			 slowing them down substantially. We fixed that for ", TO "remainder", " and also for ", TO "quotient", " and ", TO "gb", "." }}}}}

document {
     Key => "changes, 1.8",
     UL {
	  -- LI { "major improvements and additions:",
	  --      UL {
	  -- 	    }
	  --      },
	  -- LI { "packages that have been published and certified:",
	  --      UL {
	  -- 	    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
	  --      	    }
	  --      },
	  LI { "new packages:",
	       UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { TO "BinomialEdgeIdeals::BinomialEdgeIdeals", ", a package by Tobias Windisch for computations with binomial edge ideals, has been added." },
		    LI { TO "TateOnProducts::TateOnProducts", ", a package by Daniel Erman, David Eisenbud, and Frank-Olaf Schreyer for Tate resolutions on products of projective spaces, has been added." },
		    LI { TO "LatticePolytopes::LatticePolytopes", ", a package by Anders Lundman and Gustav Sædén Ståhl for computations with lattice polytopes, has been added." },
		    LI { TO "FiniteFittingIdeals::FiniteFittingIdeals", ", a package by Gustav Sædén Ståhl for computing Fitting ideals of finite modules, has been added." },
		    LI { TO "HigherCIOperators::HigherCIOperators", ", a package by David Eisenbud for computing higher complete intersection operators, has been added.
			 It implements some work of Burke, Eisenbud and Schreyer on a structure that exists on resolutions over a complete
			 intersection. This structure allows one to ", EM "lift", " a resolution over a complete
			 intersection to a resolution over the ambient ring -— a construction dual, in a sense,
			 to the well known Eisenbud-Shamash construction, which is also implemented." },
		    LI { TO "LieTypes::LieTypes", ", a package by Dave Swinarski for defining types used by the package ", TO "ConformalBlocks::ConformalBlocks", ", has been added." },
		    LI { TO "ConformalBlocks::ConformalBlocks", ", a package by Dave Swinarski for computing ranks and first Chern classes of conformal block bundles
			 on the moduli space of n-pointed curves of genus 0, has been added." },
		    LI { TO "M0nbar::M0nbar", ", a package by Han-Bom Moon and David Swinarski for calculations for divisors and F-curves on the moduli space of stable n-pointed genus zero curves, has been added." },
		    LI { TO "AnalyzeSheafOnP1::AnalyzeSheafOnP1", ", a package by David Eisenbud for decomposing a coherent sheaf on the projective line into a direct sum of line bundles and 
			 cyclic skyscraper sheaves, has been added." }
	  	    }
	       },
	  LI { "improved packages:",
	        UL {
		    -- LI { "The package ", TO "::", " has been ..." },
		    LI { "The package ", TO "Binomials::Binomials", " has been upgraded from version 1.0 to 1.2." },
		    LI { "The package ", TO "BoijSoederberg::BoijSoederberg", " has been upgraded from version 1.2 to 1.5." },
		    LI { "The package ", TO "ChainComplexExtras::ChainComplexExtras", " has been upgraded from version 0.5 to version 1." },
		    LI { "The package ", TO "MultiplierIdeals::MultiplierIdeals", " has been upgraded from version 1.0 to version 1.1." },
		    LI { "The package ", TO "CompleteIntersectionResolutions::CompleteIntersectionResolutions", " has been upgraded from version 0.8 to version 0.9.
			 It implements a number of old and new ideas about minimal resolutions over a complete intersection
			 developed by Eisenbud-Peeva, Avramov-Jorgensen, Eisenbud-Peeva-Schreyer, and
			 Burke-Eisenbud-Schreyer. Let ", TT "S = k[x_1..x_n]", " be a
			 polynomial ring, ff a codimension c regular sequence of homogeneous forms of the same degree, and ", TT "R = S/(ff)", ". It contains:",
			 UL {
			      LI { "routines to compute the structure of ", EM { "higher matrix factorization" }, "
				   on a ", EM { "high" }, " R-syzygy M — one for which the modules ", TT "Ext_R^even(M,k)", "
				   and ", TT "Ext_R^odd(M,k)", " have negative regularity over the ring of CI operators.
				   There are also routines to extract various information from the higher matrix factorization." },
			      LI { "routines that implement the reconstruction algorithm of Avramov and Jorgensen that constructs 
				   modules M having (certain kinds of) specified Ext-modules." },
			      LI { "routines to test of a conjecture of Eisenbud about the vanishing of certain local cohomology 
				   of Ext-modules, implementing the map from a module to its saturation." },
			      LI { "routines to compute the higher homotopies for ff on an S-free resolution of an S-module M 
				   annihilated by ff, and understanding the structure of module over an exterior algebra, determined
				   by the ff-homotopies on a resolution of M, on Tor^S(M,N) and Ext_S(M,N), when M and N are S-modules
				   annihilated by ff. These routines led to conjectures that were later proven, and will appear in a 
				   work-in-progress of Eisenbud, Peeva and Schreyer." },
			      LI { "routines to compute Hom in the stable category of Cohen-Macaulay R-modules, and test for stable 
				   triviality. This is used in understanding possible obstructions to commutativity of CI-operators." }
			      }
			 }
	            }
	       },
	  LI { "functionality added or improved:",
	       UL {
		    LI { "The function ", TO "pairs", " will now accept (basic) list (or sequence) ", TT "x", " and return the list of pairs ", TT "(i,x#i)", ",
			 thanks to Zach Teitler." },
		    LI { "The function ", TO "minimalPresentation", " has been modified so that it applies its degree-preserving method also for homogeneous
			 modules over affine algebras over affine algebras." },
     	       	    LI { "The function ", TO "applyKeys", " will now accept an additional function to be called when collisions occur between new keys, for combining the
			 corresponding values, thanks to Paul Zinn-Justin." },
		    LI { "The function ", TO "partition", " now takes a third argument: a list of additional values in the range of the function, allowing
			 members of the resulting partition to be empty." },
		    LI { "The function ", TO "loadPackage", " can now be used to reload a package by giving the package itself as the argument.  This
			 is easier than setting the ", TO [loadPackage, Reload], " option." },
		    LI { "The function ", TO "adjoint", " has been improved to work not just for free modules, and the function ", TT "adjoint1", " has
			 been replaced by ", TO "adjoint'", ".  This pair of function now implements both direction in the adjointness between Hom
			 and tensor product." },
		    LI { "The new function ", TO "homomorphism'", " complements ", TO "homomorphism", ".  From a map between modules it
			 produces the element of Hom." },
		    LI { "The new function ", TO "compose", " expresses composition of maps between modules as a bilinear map between Hom-modules." },
		    LI { "Bracket powers of ideals (", TO (symbol ^,Ideal,Array), ") have been added, thanks to Frank Moore." },
            LI { "Several bugs related to computing Gröbner bases in polynomial rings over ZZ have been fixed.  ", TT "trim I", " in this case
                now returns an ideal or module with a Gröbner basis as generating set, as a minimal generating set isn't well-defined.  In a future release, we hope to
                provide a function to determine a smaller set of generators.  ", TT "mingens I", " also returns the Gröbner basis matrix.  In a future release this
                function might be changed to give an error in cases where there is not a well-defined notion of minimal generators."}
	  	    }
	       },
	  LI { "functionality changed:",
	       UL {
		    LI { "The function ", TO "export", " now accepts strings and options only, not symbols." }
	       	    }
	       },
	  -- LI { "new constants and operators:",		    -- get this by diffing m2/exports.m2
	  --      UL {
	  --      	    }
	  --      }
     	  }
     }
 
document {
     Key => "changes, 1.7",
     UL {
	  -- LI { "major improvements and additions:",
	  --      UL {
	  -- 	    }
	  --      },
	  LI { "packages that have been published and certified:",
	       UL {
		    -- LI { star, " ", TO "::", ", a package by ... for ..., has been published." },
		    LI { star, " ", TO "QuillenSuslin::QuillenSuslin", ", a package by Brett Barwick and Branden Stone for 
			 computing a basis of a projective module over a polynomial ring, has been published." },
		    LI { star, " ", TO "GraphicalModels::GraphicalModels", ", a package by Luis Garcia-Puente,
			 Sonja Petrovic, Mike Stillman, and Seth Sullivant, for discrete and Gaussian graphical models, has been published." },
		    LI { star, " ", TO "InvariantRing::InvariantRing", ", a package by Thomas Hawes
			 for constructing the invariant ring of a finite group, has been published." },
		    LI { star, " ", TO "MonomialAlgebras::MonomialAlgebras", ", a package by David Eisenbud,
			 Janko Boehm, and Max Nitsche for decomposing a monomial algebra as a module over a subalgebra, has been published." },
		    LI { star, " ", TO "TorAlgebra::TorAlgebra", ", a package by Lars Winther Christensen and Oana Veliche for classification of codepth 3 local rings based on multiplication in homology, has been published, under its old name, ", TT "CodepthThree", "." }
	       	    }
	       },
	  LI { "new packages:",
	       UL {
		    -- LI { TO "::", ", a package by ... for ..., has been added." },
		    LI { TO "Book3264Examples::Book3264Examples", ", a package by Charley Crissman containing
			 Schubert2 code for some of the examples and exercises in
			 the book '3264 and all that', by Eisenbud and Harris,
			 has been added."
			 },
		    LI { TO "EnumerationCurves::EnumerationCurves", ", a package by Hiep Dang for enumeration of rational curves via torus actions, has been added." },
		    LI { TO "Divisor::Divisor", ", a package by Karl Schwede and Zhaoning Yang for working with Weil divisors, has been added." },
		    LI { TO "EllipticCurves::EllipticCurves", ", a package by Alessandro Oneto and Stefano Marseglia for addition on elliptic curves and point counting, has been added." },		
		    LI { TO "HighestWeights::HighestWeights", ", a package by Federico Galetto for decomposing free resolutions and graded modules with a semisimple Lie group action, has been added." },		
		    LI { "NumericalHilbert (absorbed by ", TO "NoetherianOperators::NoetherianOperators", "), a package by Robert Krone for numerically computing local dual spaces and Hilbert functions, has been added." },
		    LI { TO "MinimalPrimes::MinimalPrimes", ", an experimental package by Frank Moore, Mike Stillman and Franziska Hinkelmann for finding the minimal primes of an ideal, has been added." },
		    LI { TO "Bertini::Bertini", ", a package by Elizabeth Gross, Jose Israel Rodriguez, Dan Bates and Anton Leykin for providing an interface to Bertini, has been added." },
		    LI { TO "TorAlgebra::TorAlgebra", ", a package by Lars Winther Christensen and Oana Veliche for classification of codepth 3 local rings based on multiplication in homology, has been added, under its old name, ", TT "CodepthThree", "." },
		    LI { TO "Permanents::Permanents", ", a package by Tair Akhmejanov for computing the permanents of a matrix, has been added." }
	  	    }
	       },
	  LI { "improved packages:",
	        UL {
		    LI { TO "SchurRings::SchurRings", ", has been updated, with support for several groups of variables,  documentation, working plethysm, and more.
                	 The old version is being kept as ", TT "SchurRingsOld", " as there are incompatible changes.  Specifically, symmRing is now called
                	 symmetricRing, and has more variables (three sets, h, e, p) than the old version.  Please use the new version, and if there is a problem
                	 that requires you to use the old version, please email Mike Stillman."
			 },
		    LI { "The packages ", TO "Polyhedra::Polyhedra", " and ", TO "ToricVectorBundles::ToricVectorBundles", " now implement a canonical
			 ordering for the rays in a fan.  Formerly the rays came out in an unpredictable (but deterministic) order.  Various tests in the
			 latter package have been updated to take into account the new ordering.  Users may find that their code will have to 
			 be modified slightly, by permuting lists of parameters (such as weights) corresponding to the rays."
			 }
	            }
	       },
	  LI { "functionality added or improved:",
	       UL {
		    LI { "A new option,  ", TO "ExampleFiles", ", has been added to the documentation function
			 ", TO "document", ", which allows the package developer to specify that copies of certain
			 auxiliary files should be visible in the current directory while example code is
			 running."
			 },
	       	    LI {
			 "It is now possible to reduce each entry of a matrix ", TT "f", " modulo an ideal ", TT "I", "
			 by writing ", TT "f % I", ".  See ", TO (symbol %, Matrix, Ideal), "."
			 },
		    LI {
			 "A task now has a serial number, see ", TO serialNumber, "."
			 },
		    LI {
			 "A new command line option, ", TT "--no-randomize", ", prevents the random number seed from
			 being set to a value that depends on the time of day and process ID."
			 },
		    LI {
			 "A new command line option, ", TT "--no-time", ", arranges for the function ", TO "currentTime", "
			 to return 0 always, for reproducility of results, as an aid in debugging."
			 },
		    LI {
			 "A new function, ", TO "submatrixByDegrees", ", allows the user to select a submatrix of
			 a matrix by specifying intervals of acceptable column degrees or row degrees."
			 },
		    LI {
			 "New functions ", TO "elapsedTime", " and ", TO "elapsedTiming", ", analogous to ", TO "time", " and ", TO "timing", ",
			 measure elapsed time instead of CPU time."
			 },
            	    LI {
                	 "A new command ", TO "antipode", " has been added.  This function implements
                	 the anti-isomorphism between left and right modules in skew commuting poly rings.  
                	 It is used when transposing a matrix over a ring with skew commuting variables, basically,
                	 so that the transpose of a complex of matrices will still be a complex of matrices."
			 },
     	       	    LI {
			 "Hash codes of matrices have been improved - they are now computed using the first two nonzero entries
			 in each column, whereas before the entries were not examined, and thus they do a better job of distinguishing matrices
			 that are different.  A side effect is that hash tables whose keys involve matrices will
			 be stored, printed, and converted to lists in a different order, which may affect some code."
			 },
		    LI {"The default arithmetic for computing in finite fields ZZ/p nows uses the FLINT library (see ...).
			The modulus p can now be p <= 9223372036854775783, i.e. the largest prime less than 2^63.
			HOWEVER: factorization of polynomials over such rings can only be done for primes p < 2^31. TODO: CHECK THIS VALUE"},
		    LI {"Incorporated fast linear algebra for dense (mutable) matrices over finite prime fields, using ffpack and flint"},
		    LI {"Linear algebra for mutable matrices over arbitrary precision RR and CC approximate fields has been included.
			Functions which handle extended precision include determinant, rank, inverse, LUdecomposition, and solve.
			Functions SVD, eigenvalues, eigenvectors have not yet been extended"},
--		    LI {TEX ///A new function 'ZZp p' has been added.  This is simply ZZ/p, but allows options: {\tt ZZp(p, Strategy=>"Flint")},
--			{\tt ZZp(p, Strategy=>"Ffpack")}, {\tt ZZp(p, Strategy=>"Engine")}.///},
		    LI {"Extensive changes to numerical algebraic geometry code in the engine"},
            LI {"The ", TO "groebnerBasis", " function includes new experimental Gröbner code, which is much faster in some cases."},
		    -- LI {"mathicgb Gröbner basis code is used when it applies.  Actually, right now this is not accurate:
		    -- 	it can be used, but is not done so automatically."},
		    LI {"The {\tt Macaulay2/e} engine directory now compiles cleanly, with a few warning messages left."},
		    LI {"The overall structure of base rings in Macaulay2 has been revamped, to allow faster code.  The downside is
			that because of the high use of templates, compile times have generally increased."},
		    LI {"Random number generation for finite fields has changed, so programs expecting a specific
			set of random numbers will change."},
		    LI {"If ", TT "kk", " is a finite field, e.g., ", TT "ZZ/5[c]/(c^2+c+1)", " it was possible
			(and still is) to write ", TT "map(ZZ[a], kk)", ".  It was never clear what this
			should return, as it is not a well-defined ring map.  However, it now has different, 
			still undefined, behavior."}
	  	    }
	       },
	  LI { "functionality changed:",
	       UL {
		    LI { "If ", TO "debuggingMode", " is false when a package is loaded, it will remain
			 false during the loading of the package, even if the ", TO "DebuggingMode", "
			 option of ", TO "loadPackage", " or ", TO "newPackage", " is set to true.  This will help
			 the user avoid entering the debugger while already in the debugger."
			 },
		    LI {
			 "The random number seed is now initialized to 0 with ", TO "setRandomSeed", "
			 when running examples (with ", TO "installPackage", ") and when running tests
			 (with ", TO "check", "), to ensure predictability and uniformity of results."
			 }
	       	    }
	       },
	  -- LI { "new constants and operators:",		    -- get this by diffing m2/exports.m2
	  --      UL {
	  --      	    }
	  --      }
     	  }
     }

document {
     Key => "changes, 1.6",
     UL {
	  -- LI { "major improvements and additions:",
	  --      UL {
	  -- 	    }
	  --      },
	  LI { "packages that have been published and certified:",
	       UL {
		    LI { star, " ", TO "VersalDeformations::VersalDeformations", ", a package for calculating tangent and obstruction spaces as well as power series solutions for deformation problems involving isolated singularities and projective schemes,
			 has been published." 
			 },
		    LI { star, " ", TO "KustinMiller::KustinMiller", ", a package for unprojection and the Kustin-Miller complex,
			 has been published." 
			 },
	       	    }
	       },
	  LI { "new packages:",
	       UL {
		    LI { TO "PushForward::PushForward", ", a package for computing the push-forward functor for finite ring maps,
			 has been added.  (It should have been added to the previous distribution.)" 
			 },
		    LI { TO "EliminationMatrices::EliminationMatrices", ", a package for computing resultants,
			 has been added." 
			 },
		    LI { TO "EllipticIntegrals::EllipticIntegrals", ", a package for numerical computation of elliptic integrals and elliptic functions,
			 has been added." 
			 },
		    LI { TO "Triplets::Triplets", ", a package for computing Betti diagrams and hypercohomology tables associated to triplets of degree sequences,
			 has been added." 
			 },
		    LI { TO "CompleteIntersectionResolutions::CompleteIntersectionResolutions", ", a package for analyzing the asymptotic
			 structure of minimal resolutions over a complete intersection, has been added."
			 },
	  	    }
	       },
	  LI { "improved packages:",
	       UL {
     	       	    LI { "The package ", TO "GraphicalModels::GraphicalModels", " has been extended significantly by its authors.
			 The previous version of this package was simply a basic extension of the package ", TO "Markov::Markov", ".
			 Among the new algorithms implemented are procedures for computing the vanishing ideal of a graphical model 
			 and for checking for identifiable parameters in Gaussian mixed graph models. These procedures can be used 
			 to study fundamental problems about graphical models."
			 },
		    LI { "The package ", TO "Schubert2::Schubert2", " now handles intersection rings of ", EM "isotropic", " flag bundles,
			 with an algorithm based on a theorem in a paper of Grayson, Seceleanu, and Stillman."
			 },
	       	    }
	       },
	  LI { "functionality added or improved:",
	       UL {
	       	    LI { "Factoring of polynomials over non-prime Galois fields has been added, using the ", TO "Singular-Factory", " library." },
		    LI { "The methods for ", TO (Hom,Matrix,Module), " and ", TO (Hom,Module,Matrix), " now handle non-free modules.
			 There is also a new method for ", TO (Hom,Matrix,Matrix), "." },
		    },
	       },
	  LI { "functionality changed:",
	       UL {
		    LI { "changed the order of loading packages inside a package, as specified by ", TO [newPackage, PackageImports],
			 " and ", TO [newPackage, PackageExports], " options, so that the order of loading is easy to specify (to
			 avoid problems with shadowed variables).  The packages are loaded with ", TO "needsPackage", ",
			 and now the imported packages are loaded before the exported packages.  So, if there is a
			 problem, just replicate all the exported packages in the list of imports, and juggle the order of
			 the list of imports."
			 },
		    LI { "The function ", TO "temporaryFileName", " now obeys the TMPDIR environment variable, 
			 the way other unix applications do, rather than putting temporary files into the 
			 directory ", TT "/tmp", "."
			 },
	       	    }
	       },
	  LI { "new constants and operators:",		    -- get this by diffing m2/exports.m2
	       UL {
		    LI { "New functions ", TO "fileReadable", ", ", TO "fileWritable", ", ", TO "fileExecutable", " provide information
			 about file permissions."
	       	    	 },
		    LI { "The class ", TO "Task", " replaces ", TT "Thread", ", and the function ", TO "isCanceled", " tells whether
			 a task has been canceled."
	       	    	 },
	       	    }
	       }
     	  }
     }

document {
     Key => "changes, 1.5",				    -- the 1.5 branch was created 2012-05-21 with svn release 14617
     UL {
	  LI { "major improvements and additions:",
	       UL {
		    LI {
			 "A facility for scheduling tasks to be performed in parallel (in threads) has been developed.
			 See ", TO "parallel programming with threads and tasks", "."
			 }
	       	    }
	       },
	  LI { "packages that have been published and certified:",
	       UL {
		    LI { star, " ", TO "Nauty::Nauty", ", a package for an interface to the program ", TT "nauty", ", which
			 provides efficient methods for determining whether
            		 graphs are isomorphic, generating all graphs with particular properties,
            		 generating random graphs, and more,
			 has been published." 
			 },
		    LI { star, " ", TO "NumericalAlgebraicGeometry::NumericalAlgebraicGeometry", ", a package for using 
			 polynomial homotopy continuation to solve systems of polynomial equations and describing positive-dimensional 
			 complex algebraic varieties, has been published." 
			 },
		    LI { star, " ", TO "Binomials::Binomials", ", a package for binomial ideals with a particular focus on
			 intersection decompositions and associated primes,
			 has been published." 
			 },
		    }
	       },
	  LI { "new packages:",
	       UL {
		    LI { TO "BIBasis::BIBasis", ", a package for constructing reduced Pommaret and Gröbner bases in a Boolean ring,
			 has been added." },
		    LI { TO "CharacteristicClasses::CharacteristicClasses", ", a package for degrees of Chern classes and other characteristic classes of projective schemes,
			 has been added." },
		    LI { TO "KustinMiller::KustinMiller", ", a package for unprojection and the Kustin-Miller complex construction,
			 has been added." },
		    LI { TO "MonomialAlgebras::MonomialAlgebras", ", a package for decomposing a monomial algebra as a module over a subalgebra,
			 has been added." },
		    LI { TO "MultiplierIdeals::MultiplierIdeals", ", a package for computing multiplier ideals of monomial ideals,
			 has been added (originally called ", TT "MonomialMultiplierIdeals", ")." },
		    LI { TO "NautyGraphs::NautyGraphs", ", a package for an interface to ", TT "nauty", " (Graphs fork),
			 has been added." },
		    LI { TO "QthPower::QthPower", ", a package for computing the integral closure of type I affine domains,
			 has been added." },
		    LI { TO "RandomObjects::RandomObjects", ", ",
			 TO "RandomCanonicalCurves::RandomCanonicalCurves", ", ",
			 TO "RandomCurves::RandomCurves", ", ",
			 TO "RandomGenus14Curves::RandomGenus14Curves", ", ",
			 TO "RandomPlaneCurves::RandomPlaneCurves", ", and ",
			 TO "RandomSpaceCurves::RandomSpaceCurves", ", packages for the construction of random points of unirational moduli spaces,
			 have been added." },
		    LI { TO "TensorComplexes::TensorComplexes", ", a package for multilinear algebra for the construction of tensor complexes,
			 has been added." },
		    LI { TO "Units::Units", ", a package for conversion of units of measure,
			 has been added." },
		    LI { TO "VersalDeformations::VersalDeformations", ", a package for calculating versal deformations and local Hilbert schemes,
			 has been added." },
	  	    }
	       },
	  -- LI { "improved packages:",
	  --      UL {
	  --      	    }
	  --      },
	  LI { "functionality added or improved:",
	       UL {
		    LI {
			 "The function ", TO "temporaryFileName", " now produces file names with no chance of
			 collision, and deletes the files upon normal termination of the program."
			 },
		    LI {
			 "The function ", TO "newPackage", " now has two new options, ", TO [newPackage, PackageExports], " and ", TO [newPackage, PackageImports], ",
			 which provide a more robust way to specify that other packages should be loaded when this new
			 package is loaded."
			 },
		    LI {
			 "The new functions ", TO "limitFiles", " and ", TO "limitProcesses", " can be used to impose resource limits on the current
			 process."
			 }
		    }
	       },
	  LI { "functionality changed:",
	       UL {
		    LI {
			 "Now ", TT "F = GF p", " will return a ring of type ", TO "GaloisField", " when ", TT "p", " is prime,
			 instead of returning the quotient ring ", TT "ZZ/p", ".  In particular, the generator ", TT "F_0", "
			 will be a generator of the multiplicative group."
			 }
	       	    }
	       }
	  -- LI { "new constants and operators:",
	  --      UL {
	  --      }
	  -- }
	  }
     }

document {
     Key => "changes, 1.4",				    -- the branch for 1.4 was created 2010-09-23 with release 12341
     UL {
	  LI { "major improvements and additions:",
	       UL {
		    LI {
			 "In preparation for running Macaulay2 in parallel using threads, the Safe C language, in which the
			 interpreter is written, has been reworked.  The chief advantage is that now, references to 
			 top level objects now consist of a single address pointer, and thus assignment can happen
			 atomically.  Formerly, a small integer (for identifying the type of object pointed to) accompanied
			 the pointer, but now it is stored with the rest of the object.  Also, new keywords have been
			 added to allow the definition of new types, support has been added for translation to C++,
			 and support for atomic operations and thread local variables has been added."
			 }
	       	    }
	       },
	  LI { "new packages:",
	       UL {
		    LI { TO "AdjointIdeal::AdjointIdeal", ", a package for adjoint ideals of plane curves, has been added." },
		    LI { TO "BooleanGB::BooleanGB", ", a package for Gröbner bases in Boolean rings, has been added." },
		    LI { TO "DGAlgebras::DGAlgebras", ", a package for handling differential graded algebras, has been added." },
		    LI { TO "FormalGroupLaws::FormalGroupLaws", ", a package for commutative formal group laws, has been added." },
		    LI { TO "GraphicalModels::GraphicalModels", ", a package for discrete and Gaussian statistical graphical models,
			 has been added." },
		    LI { TO "Graphics::Graphics", ", a package for creating graphics, has been added." },
		    LI { TO "Graphs::Graphs", ", a package providing data types, visualization, and basic functions for graphs, has been added." },
		    LI { star, " ", TO "HodgeIntegrals::HodgeIntegrals", ", a package for Hodge integrals on the moduli space of curves, has been added and certified." },
		    LI { TO "Kronecker::Kronecker", ", a package for Kronecker and rational normal forms, has been added." },
		    LI { star, " ", TO "ModuleDeformations::ModuleDeformations", ", a package for
			 computing versal deformations of maximal Cohen-Macaulay modules, has been added and certified." },
		    LI { TO "NAGtypes::NAGtypes", ", a package containing declarations of types needed by two 
			 other packages, has been added." },
		    LI { TO "Nauty::Nauty", ", an interface package for the program ", TT "nauty", ", which
			 computes automorphism groups of graphs and digraphs, has been added." },
		    LI { star, " ", TO "Normaliz::Normaliz", ", an interface package to the program ", TT "normaliz", ",
			 which computes the Hilbert basis of a rational cone, has been certified." },
		    LI { TO "NormalToricVarieties::NormalToricVarieties", ", a package designed to manipulate normal toric
  			 varieties and related geometric objects, has been added." },
		    LI { TO "Parametrization::Parametrization", ", a package for rational parametrization of rational plane curves, has been added." },
		    LI { TO "PHCpack::PHCpack", ", an interface package to the program ", TT "PHCpack", ", 
			 which uses homotopy continuation methods to solve systems of polynomial equations numerically, has been added." },
		    LI { TO "Serialization::Serialization", ", a preliminary package for saving Macaulay2 objects in files, has been added." },
		    LI { star, " ", TO "SimplicialDecomposability::SimplicialDecomposability", ", a package
			 containing various decomposability routines for simplicial complexes, has been added and certified." },
		    LI { star, " ", TO "ToricVectorBundles::ToricVectorBundles", ", a package for vector bundles
			 on toric varieties, has been added and certified." },
		    LI { TO "WeylGroups::WeylGroups", ", a package for root systems and Weyl groups, has been added." },
		    }
	       },
	  LI { "improved packages:",
	       UL {
		    LI { TO "BGG::directImageComplex", ", now has the ability to compute direct image complexes, 
			 and maps between them." },
		    LI { TO "Polyhedra::Polyhedra", ", a package for computations with
			  convex polyhedra, has been improved: matrices that are returned from polyhedral objects
			  are over ", TO "ZZ", " now, except for vertices of a polyhedron; 
			  ", TO "FourierMotzkin::fourierMotzkin", " is now called only once, to
			  increase the speed in higher dimensions."
			  },
		    LI { TO "Schubert2::Schubert2", ", a package for enumerative geometry, has
			 been well documented (finally) and has been improved, e.g. incidence correspondences between flag varieties has been added." },
		    LI {
			 "The ", TO "SimpleDoc::SimpleDoc", " package, used for documentation in Macaulay2, has a new function, ", TO "multidoc", ",
			 that allows multiple documentation nodes per string.  The format of the ", BOLD "Consequences", "
			 section has changed.  There is a new keyword, ", BOLD "Pre", ", that allows preformatted
			 text to be easily inserted.  "
			 },
		    LI {
			 "The package ", TO "XML::XML", " has been documented."
			 }
	       	    }
	       },
	  LI { "functionality added or improved:",
	       UL {
	       	    LI {
			 "The debugging function ", TO "on", " has been improved."
			 },
		    LI {
			 "Gröbner bases over fields are now autoreduced, so the answer is mathematically
			 well-defined.  Resulting changes in coefficients of polynomials in matrices returned by such
			 functions as ", TO "syz", " and ", TO "complement", " may be observed."
			 },
		    LI {
			 "The function ", TO basis, ", now is functorial: if given a matrix, it returns the matrix 
			 between the images of the bases of the source and target."
			 },
		    LI {
			 "The functions ", TO basis, ", and ", TO "Truncations::truncate(List,Module)", " now allow partial multidegrees to be given.
			 The result is a basis or generating set over the subring generated by variables whose initial
			 degrees are zero."
			 },
		    LI {
			 "Various bug fixes, including several memory leaks, and an efficiency related bug where 
			 e.g. ", TT "generators gb I", ", of an ideal over the rationals,
			 would take a long time to compute"},
		    LI {
			 TT "TEX", " mode can now handle ", TT "$\\mapsto$", "."
			 },
		    LI {
			 "Addition of ideals with an expression such as ", TT "I+J", " has been extended to
			 work in the case where ", TT "I", " and ", TT "J", " are ideals in different, but compatible, rings.
			 Here compatibility means the one is an predecessor of the other, as would be the coefficient
			 ring of a polynomial ring or the ambient ring of a quotient ring."
			 },
		    LI {
			 "Added a new method, ", TO (matrix,RingElement), ", that makes a one by one matrix
			 from a ring element."
			 },
		    LI {
			 "Added a new method ", TO (exp,RingElement), " for the exponential function applied
			 to a nilpotent ring element."
			 }
		    }
	       },
	  LI { "functionality changed:",
	       UL {
		    LI { "Elements of sets are now sorted before printing." },
		    LI {
			 "Loading a package twice now gives an error unless you use the ", TO [loadPackage, Reload], " option.
			 Reloading a package can lead to subtle errors.  For example, if the package creates a new type,
			 then it will do that each time the package is loaded, and objects of that type that
			 were created before reloading will not work after reloading.  Also, reloading a
			 package may cause a memory leak."
			 },
		    LI {
			 "The function ", TO "getSymbol", " now always creates a symbol in the user dictionary, whereas formerly,
			 it provided an existing symbol, or created one in the first mutable dictionary listed by ", TO "dictionaryPath", ".
			 The reason is that the main application in a package is to create symbols to server as variables in polynomial
			 rings to be handed to the user, and the user will need those symbols to be visible."
			 },
		    LI {
			 "The one-letter symbols, which are treated specially by ", TO "vars", ", are now no longer
			 pre-defined.  Now they are created when needed.  Packages can create them with ", TO "getSymbol", ".
			 This change is intended to prevent the kind of bug where a package unintentionally refers to or modifies a one-letter global
			 variable."
			 },
		    LI {
			 "Packages containing unset mutable private global symbols will now be flagged with an error message,
			 and the locations of the offending symbols will be given.  This is intended to be an aid in detecting
			 bugs, because one common way for such symbols to arise is by misspelling the name of a function parameter
			 or the name of a local variable.  Another way they arise is by forgetting to declare that a variable used just
			 inside the body of a function is a local variable."
			 },
		    LI {
			 "A new way to create a polynomial ring in a package whose variables are based on symbols in the user dictionary
			 is to put the names in quotation marks, like this: ", TT ///QQ["x","y"]///, ".  Now that the one-letter symbols
			 are no longer predefined in the Core dictionary, something like this will be necessary, as ", TT ///QQ[x,y]///, " will
			 not work, because ", TT "x", " and ", TT "y", " will refer to private global symbols of the package, and will
			 most likely now get flagged as errors."
			 }
	       	    }
	       }
	  -- LI { "new constants and operators:",
	  --      -- UL {
	  --      -- 	    }
	  --      }
	  }
     }

document {
     Key => "changes, 1.3.1",
     UL {
	  LI { "major improvements and additions:",
	       UL {
		    LI { "packages newly included:",
			 UL {
			      TO "NumericalAlgebraicGeometry::NumericalAlgebraicGeometry",
			      TO "BeginningMacaulay2::BeginningMacaulay2"
			      }
			 }
		    }
	       },
	  LI { "functionality added or improved:",
	       UL {
		    LI {
			 "The behavior of ", TO "loadDepth", " has been reworked, with the goal being to arrange for
			 error messages, signalled by code in a package that has been loaded without debugging mode enabled
			 (see ", TO "newPackage", " and ", TO "loadPackage", "), to appear to come from the user's code
			 instead (when the filename, line number, and column number of the error are displayed)."
			 },
		    LI {
			 "Fixed a bug: determinants and minors in
			 rings over RR or CC would give wrong answers
			 or even crash M2.  The Bareiss strategy
			 now gives an error in this case, and the Cofactor
			 strategy is the default in this case.
			 Additionally, pfaffians over such rings are now
			 declared as not implemented."
			 },
		    LI {
			 "Matrices over different rings can now be joined together (see ", TO (symbol |,Matrix,Matrix), ",
			 ", TO (symbol ||,Matrix,Matrix), ", and ", TO (symbol ++,Matrix,Matrix), ")."
			 },
		    LI {
			 "The functions used with ", TO "merge", " and ", TO "combine", " now have a way to indicate that the resulting
			 hash table should have no entry corresponding to the current key."
			 }
		    }
	       }
	  }
     }

document {
     Key => "changes, 1.3",
     UL {
	  LI { "major improvements and additions:",
	       UL {
		    LI {
			 "A new option ", TO [newPackage, Certification], " for ", TO "newPackage", ", provides information about packages that have been
			 accepted for publication in a refereed journal.  The information is displayed in the top documentation node of
			 the package.  The first three packages so certified
			 are ", TO "EdgeIdeals::EdgeIdeals", " ", star, ", ", TO "PieriMaps::PieriMaps", " ", star, ", 
			 and ", TO "Polyhedra::Polyhedra", " ", star, "."
			 },
		    LI { "New packages ", TO "OpenMath::OpenMath", " and ", TO "SCSCP::SCSCP", " for communicating via SCSCP with OpenMath to 
			 programs such as GAP and Maple have been developed, 
			 thanks to Dan Roozemond.  They depend on the new package ", TO "XML::XML", ", which uses the ", TT "libxml2", " 
			 library to parse ", TT "XML", " code." },
		    LI { "The programs ", TO "4ti2", ", ", TO "gfan", ", and ", TO "normaliz", " are now included with ", EM "Macaulay2", " 
			 binary distributions, and are compiled automatically during Macaulay2's build process, with automatic downloading
			 available as an option.  This makes the packages ", 
			 TO "FourTiTwo::FourTiTwo", ", ",
			 TO "gfanInterface::gfanInterface", ", ",
			 TO "Normaliz::Normaliz", ", and ",
			 TO "StatePolytope::StatePolytope", ", each of which uses one or more of them, more readily usable.",
			 },
		    LI { "packages newly included:",
			 UL {
			      TO "ConvexInterface::ConvexInterface",
			      TO "MapleInterface::MapleInterface",
			      TO "OpenMath::OpenMath",
			      TO "Posets::Posets",
			      TO "RationalPoints::RationalPoints",
			      TO "SCSCP::SCSCP",
			      TO "SRdeformations::SRdeformations",
			      TO "XML::XML"
			      }
			 },
		    LI { "Improved handling of finite fields: ", TO "GF", " now uses ",
			 TO2{"ConwayPolynomials :: ConwayPolynomials","Conway polynomials"}, " when possible.
			 Maps between Galois fields made with them are now easy to produce 
			 with ", TT "map(E,F)", ".  (This was advertised as a change to 1.2, when the package was introduced,
			      but the package was not pre-loaded, whereas now it is.)." },
		    LI {
			 "Fixed a long-standing bug in ", TO "Saturation :: saturate", " that caused it to give incorrect answers (too small)
			 in the case that the following three conditions all held:
			 the ring has a non-standard monomial ordering, such as a weight vector; all variables had degree 1;
			 and the degree of the element being used to saturate was equal to 1."
			 },
		    LI {
			 "The function ", TO "toField", " has been changed so that the expression ", TT "F = toField A", " returns a new 
			 ring ", TT "F", " isomorphic to ", TT "A", " and declares it to be field, whereas formerly ", TT "A", " was declared to 
			 be a field, without creating a new ring.  Users of this function should check their code and ensure
			 that the return value ", TT "F", " is used.
			 The return value is a polynomial ring of no variables over A, with a new monomial ordering, and with degree length
			 equal to 0.  The advantage is that now various computations in polynomial rings over the newly declared field will 
			 provide correct answers."
			 },
		    LI { "Fixed a bug in degree(x,f) where the degrees of the grading were used instead of the actual exponents." },
		    LI {
			 "Fixed a bug in ", TO "read", " reported by Dan Roozemond: whenever it would return a string of length 4096, subsequent
			 read operations would change the bytes in it."
			 },
		    LI {
			 "The package ", TO "IntegralClosure::IntegralClosure", " has been rewritten.  The
			 ring used as input for ", TO "IntegralClosure::integralClosure", " must be a
			 domain, but the documentation describes how to get around this.  
			 The function now provides correct output when it finishes, and it can handle much larger input 
			 than before.  There are some new routines and some new strategies for the computation."
			 },
		    LI {
			 "A bug in Gröbner bases over the integers was fixed, which, under certain situations, led to
			 an incomplete Gröbner basis."},
		    LI {
			 "A bug in Gröbner bases over fields and the integers was fixed, which caused, under some situations,
			 the list of \"trimmed\" generators to be incomplete (but the Gröbner basis itself was correct).
			 This impacted functions which use ", TO "trim", ", especially ", TO "MinimalPrimes :: minimalPrimes", "."
			 },
		    LI {
			 "The function ", TO "Elimination::eliminate", , " has been fixed.  The function previously quietly assumed a flat polynomial ring,
			 with no quotient elements, and also quietly assumed that the ring was commutative.  Now error
			 messages are given when it would have produced incorrect answers, and it handles Weyl and skew 
			 commutative poly rings correctly.  Additionally, this function now uses an elimination order 
			 rather than a product order, improving performance in many cases."
			 },
		    LI {
			 "Fixed a a bug in ", TO "independentSets", ", which produced incorrect answers
			 on the cygwin version.  A variable was not being initialized.  Thanks to B. Roune for
			 reporting the bug and suggesting the fix."
			 },
		    LI {
			 "A bug in ", TO "MinimalPrimes::minimalPrimes", " was unearthed that could produce incorrect answers.  The problem
			 was that ", TO "trim", " sometimes could produce incorrect answers (fixed)."
			 },
		    LI {
			 "Fixed a bug where if the degrees of the variables in a ring were not all equal to 1, and weight vectors
			 were present, then the monomial ordering was not the documented one."
			 },
		    LI {
			 "Fixed a bug in ", TO "minimalPresentation", " of an ", TO "Ideal", " or ", TO "Ring", ", which would produce
			 incorrect answers in rare situations."
		    	 },
	       	    }
	       },
	  LI { "functionality added or improved:",
	       UL {
		    LI {
			 "The method function ", TO (minimalPresentation,Ring), " now allows an option, ", TO [minimalPresentation, Exclude], ", which takes a list
			 of integers: the variables with these indices will not be eliminated.  Indices are used, because
			 if the ring is a quotient by linear polynomials, then variables might have normal forms that are
			 complicated polynomials."
			 },
		    LI {
			 "The function ", TO "installPackage", " will now, when the option ", TT "AbsoluteLinks", " is set to ", TO "true", ",
			 will now also search the installation prefix where the package is about to be installed for the files that are linked to.
			 This should resolve the situation where a developer uses the function to modify a package that is already incorporated
			 into ", EM "Macaulay2", " itself, and (some of) the links in the freshly installed package end up pointing to 
			 the wrong web pages."
			 },
		    LI { "The expression ", TT "setRandomSeed()", " can now be used to re-initialize the random number generator;
			 see ", TO "setRandomSeed", "." },
		    LI { "The operator ", TO "..", " can now be used to generate sequences of consecutive strings." },
		    LI { "A new binary operator ", TO "..<", " provides for the generation of sequences that stop one short of
			 those provided by ", TO "..", " ." },
		    LI { "The operator ", TO "..", ", will now deliver rectangular sequences of consecutive indexed variables, 
			 e.g., ", TT "x_1 .. y_2", " will have the value ", TT "(x_1,x_2,y_1,y_2)", "."},	       
		    LI { "A new variable, ", TO "handleInterrupts", ", specifies whether Macaulay2's interrupt handlers for 
			 SIGINT and SIGALRM are installed." },
		    LI { "The function ", TO "EXAMPLE", " will now accept objects of type ", TO "PRE", " to be interpreted as
			 preformatted example output." },
		    LI { "The function ", TO "openListener", " can now open a socket on a specified interface." },
		    LI {
			 "The function ", TO "SimpleDoc::doc", " will now handle example input expressions that span multiple lines: within in 
			 each expression, indent lines after the first one more than the first."
			 },
		    LI {
			 "Multiplication of a scalar and a mutable matrix is now not allowed.  Previously
			 attempting this could cause ", EM "Macaulay2", " to crash."
			 },
		    LI { "Very long lists can now be parsed without overflowing the stack and causing the program to crash.
			 This was a problem for MacOS with lists of length greater than about 90000.  In a future version
			 we plan to reduce the amount of memory required to parse, translate, and then evaluate the list." 
			 }
		    }
	       },
	  LI { "functionality changed:",
	       UL {
		    LI { "The CTRL-C interrupt signal SIGINT will now interrupt system calls (such as read and write) that are
			 in progress; formerly, they were restarted by the kernel
			 after the handler set a flag.  This necessitated reworking the handling of interrupts
			 by the top level interpreter, which will now respond to them immediately.
			 When the readline library is active and reading user input (such as
			 when the Emacs interface to Macaulay2 is not used), interrupts are handled just by it."
			 },
		    LI { TO "currentDirectory", " is now a function rather than a string constant, in order to postpone signalling 
			 an error if a component of the path to the current working directory no longer exists."
			 },
		    LI { "When the program starts, the random number seed is now initialized to a value that 
			 depends on the date, time in seconds,
			 and the process id.  The former initial state can be obtained with ", TT "setRandomSeed()", "." },
		    LI { "The function ", TO "realpath", " now returns a string ending in '/' if the path leads to a directory, for
			 consistency with the convention elsewhere in Macaulay2 that directory names end in '/'." },
		    LI { "The ", TO "UserMode", " option to ", TO "installPackage", " and ", TO "check", " now has 
			 default value ", TO "null", ", meaning to propagate the command line option ", TT "-q", ", if present, to child 
			 processes running M2 on examples and tests"
			 },
		    LI { "If you set the variable ", TO "gbTrace", " to 15, then now one sees a large amount of information
			 about the S-pairs computed during a Gröbner basis computation, if the default algorithm is in use."
			 },
		    LI { "The initialization file ", TT "init.m2", " is now sought only in the user's application directory, and 
			 not also in the current directory."
			 }
		    }
	       },
	  LI { "new constants and operators:",
	       UL {
		    LI {
			 "New constants ", TO "rootPath", " and ", TO "rootURI", " provide prefixes to be prepended to absolute file paths so that
			 native Microsoft Windows programs can find them."
			 },
		    LI { "New binary operators ", TO "<==", " and ", TO "<===", " have been introduced.  The operators are 
			 flexible, i.e., the user can install methods for them."
			 }
		    }
	       }
	  }
     }

document {
     Key => "changes, 1.2",
     UL {
	  LI { "major improvements and additions:",
	       UL {
		    LI { "Improved old documentation and added many new descriptions of functions." },
		    LI {
			 "Greatly improved the debugger. In particular, the debugger will 
			 put you directly onto the line of the program with an error, and allows the user to
			 execute a given number of steps of the program (see ", TO "step", ") and to conveniently display
			 and change values of variables as they evolve."
			 },
		    LI { "Improved the making of packages: made it much easier for a user
			 to create a complete package, including documentation."
			 },
		    LI { "Improved the handling of symmetric algebras and Rees algebras;
			 improved implementation of things like analytic spread."
			 },
		    LI { "Improved handling of finite fields: ", TO "GF", " now uses ",
			 TO2{"ConwayPolynomials :: ConwayPolynomials","Conway polynomials"}, " when possible.
			 Maps between Galois fields made with them are now easy to produce 
			 with ", TT "map(E,F)", ".  (Note: actually, the user must load the package manually.)" },
		    LI {"The function ", TO "hilbertFunction", " is now faster at computing power series expansions."},
		    LI { "Homomorphisms (maps) of modules over different rings with respect to a ring homomorphism
			 between them are now supported.  Composition, coimage (replacing pushForward1), and kernel work.
			 An option has been added to ", TO "basis", " to ask it to return such a homomorphism.  See ",
			 TO (map,Module,Module,RingMap,Matrix), ", ", TO (map,Module,Nothing,RingMap,Matrix), ", and ",
		    	 TO (map,Module,RingMap), "."
			 },
		    LI { "The total Ext functor now accepts multigraded modules, see ", TO (Ext,Module,Module), "." },
		    LI { "Macaulay2 now incorporates ", HREF {"http://pari.math.u-bordeaux.fr/", "PARI"}, ", a free library for computing in number theory.
			 It is used by ", TO (factor,ZZ), ", ", TO (factor,QQ), ", ", TO (isPseudoprime, ZZ), ", and ", TO (isPrime,ZZ), "."
			 },
		    LI { "new packages, included:",
			 UL {
			      TO "BGG :: BGG",
			      TO "BoijSoederberg :: BoijSoederberg",
			      TO "Bruns :: Bruns",
			      TO "ConwayPolynomials :: ConwayPolynomials",
			      TO "EdgeIdeals :: EdgeIdeals",
			      TO "FourTiTwo :: FourTiTwo",
			      TO "gfanInterface::gfanInterface",
			      TO "LocalRings :: LocalRings",
			      TO "Polyhedra :: Polyhedra",
			      TO "Polymake :: Polymake",
			      TO "SimpleDoc :: SimpleDoc",
			      TO "StatePolytope :: StatePolytope",
			      TO "SymmetricPolynomials :: SymmetricPolynomials",
			      TO "Text :: Text"
			      }
			 },
		    LI { "downloadable packages:",
			 UL {
			      LI { EM "Kronecker", ", Kronecker normal form of a matrix pencil, by Edward Carter" },
			      LI { EM "LDL", ", the ", TT "LDL'", " factorization of a positive semidefinite matrix, by Helfried Peyrl" }
			      } },
		    LI { "improved packages:",
			 UL {
			      TO "HyperplaneArrangements::HyperplaneArrangements",
			      TO "ReesAlgebra::ReesAlgebra",
			      TO "PieriMaps::PieriMaps",
			      TO "Schubert2::Schubert2",
			      TO "SchurFunctors::SchurFunctors"
			      } } } },
	  LI { "new functions:",
	       UL {
		    TO groupID,
		    TO heft,
		    TO insert,
		    TO inversePermutation,
		    TO isSorted,
		    TO multidegree,
		    TO runLengthEncode,
		    TO selectVariables,
		    TO "step",
		    TO switch,
		    }
	       },
	  LI { "new methods for old functions:",
	       UL {
		    TO (all,ZZ,Function),
		    TO (any,ZZ,Function),
		    TO (degreesMonoid,List),
		    TO (degreesRing,Monoid),
		    TO (degreesRing,List),
		    TO (export,String),
		    TO (findFiles,List),
		    TO (flattenRing,Ideal),
		    TO (gcd,RingElement,ZZ),
		    TO (gcd,ZZ,RingElement),
		    TO (indices,Matrix),
		    TO (map,Module,Module,RingMap,Matrix),
		    TO (map,Module,Nothing,RingMap,Matrix),
		    TO (map,Module,RingMap),
		    TO (map,Module,ZZ,ZZ),
		    TO (part,InfiniteNumber,InfiniteNumber,VisibleList,RingElement),
		    TO (part,InfiniteNumber,InfiniteNumber,RingElement),
		    TO (part,InfiniteNumber,ZZ,VisibleList,RingElement),
		    TO (part,InfiniteNumber,ZZ,RingElement),
		    TO (part,Nothing,Nothing,VisibleList,RingElement),
		    TO (part,Nothing,Nothing,RingElement),
		    TO (part,Nothing,ZZ,VisibleList,RingElement),
		    TO (part,Nothing,ZZ,RingElement),
		    TO (part,ZZ,InfiniteNumber,VisibleList,RingElement),
		    TO (part,ZZ,InfiniteNumber,RingElement),
		    TO (part,ZZ,VisibleList,RingElement),
		    TO (part,ZZ,Nothing,VisibleList,RingElement),
		    TO (part,ZZ,Nothing,RingElement),
		    TO (part,ZZ,ZZ,VisibleList,RingElement),
		    TO (part,ZZ,ZZ,RingElement),
		    TO (quotientRemainder,Number,RingElement),
		    TO (quotientRemainder,RingElement,Number),
		    TO (quotientRemainder,RingElement,RingElement),
		    TO (scanLines,Function,List),
		    TO (support,Matrix),
		    TO (symbol <-,Sequence),
		    TO (symbol _,Number,Ring),
		    TO (symmetricAlgebra,Matrix),
		    TO (symmetricAlgebra,Nothing,Nothing,Matrix),
		    TO (symmetricAlgebra,Nothing,Ring,Matrix),
		    TO (symmetricAlgebra,Ring,Nothing,Matrix),
		    TO (symmetricAlgebra,Ring,Ring,Matrix),
		    TO (symbol ^, Number, Ring),
		    TO (symbol ^, Number, RingFamily)
		    }
	       },
	  LI { "new variables:",
	       UL {
		    TO "currentLayout",
		    TO "prefixPath",
		    TO "lastMatch"
		    }
	       },
	  LI { "new symbols:",
	       UL {
		    TO FlatMonoid,
		    TO Join,
		    TO Reduce,
		    TO Result,
		    TO RunExamples,
		    TO SeparateExec,
		    TO SourceRing
		    }
	       },
	  LI { "new optional arguments to functions:",
	       UL {
		    TO [GF,SizeLimit],
		    TO [basis,SourceRing],
		    TO [check,UserMode],
		    TO [fillMatrix, Height],
		    TO [flattenRing,Result],
		    TO [hilbertSeries,Reduce],
		    TO [installPackage,CacheExampleOutput],
		    TO [installPackage,RunExamples],
		    TO [installPackage,SeparateExec],
		    TO [installPackage,UserMode],
		    TO [installPackage,Verbose],
		    TO [lift,Verify],
		    TO [map,DegreeLift],
		    TO [monoid,DegreeLift],
		    TO [monoid,Join],
		    TO [newPackage,CacheExampleOutput],
		    TO [newRing,DegreeLift],
		    TO [newRing,DegreeMap],
		    TO [newRing,Join],
		    TO [symmetricAlgebra,DegreeLift],
		    TO [symmetricAlgebra,DegreeMap],
		    TO [symmetricAlgebra,Join],
		    TO [(tensor, Monoid, Monoid),DegreeLift],
		    TO [(tensor, Monoid, Monoid),DegreeMap],
		    TO [(tensor, Monoid, Monoid),Join],
		    }
	       },
	  LI { "functionality removed or changed:",
	       UL {
		    LI {"Comparison of rings and ring maps with ", TO "==", " is no longer supported.
			 Old code can be fixed by changing the comparison operator to ", TO "===", "."},
		    LI {
			 "The variable ", TT "randomHeight", " has been removed, replaced by 
			 ", TO [fillMatrix, Height], " and ", TO [random,Height], "."
			 },
		    LI {
			 "The function ", TO betti, " now uses the dot product of the heft vector of the ring with
			 the (multi)degrees of the basis elements in a chain complex in its display.  See ", TO "heft vectors", "."
			 },
		    LI {"The behavior of ", TO "return", " in the debugger has changed: it now stops in the debugger
			 at the next available opportunity."
			 },
		    LI {"The function ", TO "minors", " has been altered so the ideal of ", TT "n", " by ", TT "n", " minors that it provides for negative
			 values of ", TT "n", " is the unit ideal."
			 },
		    LI {
			 "The optional argument to ", TO monoid, " and to polynomial ring creation 
			 named ", TT "ConstantCoefficients", " has been removed.  Specifying ", TT "ConstantCoefficients=>false", " 
			 can be accomplished by specifying ", TT "Join=>false", ".  See ", TO Join, "."
			 }
		    }
	       },
	  LI { "functionality added or improved:",
	       UL {
		    LI {"Filenames starting with ", TT "~/", " will have the tilde replaced by the home directory."},
		    LI {"The ", EM "D", " language, in which the Macaulay2 interpreter is written, is now type-safe"},
		    LI {"During compilation of Macaulay2, as much of the computation as possible is now done
			 to satisfy the make-target ", TT "all", ", with the resulting files placed in a staging
			 area, ready for quickly satisfying the make-target ", TT "install", "."
			 },
		    LI {"During compilation of Macaulay2, it is now possible to keep the architecture independent
			 files in a separate directory tree, saving time if versions for multiple architectures
			 are to be built.  Including those files in a source tar file will allow the distribution
			 of a ", EM "fat", " source tar file, speeding up compilation."
			 },
		    LI {"Pressing the RET key in the Macaulay2 interaction buffer on a line containing
			 a source file name and line number will open up the source file at that position in
			 a new buffer.  This allows error messages to be treated with dispatch."
			 },
		    LI {"The behavior of ", TO "setup", " has changed, in that the commands that set the paths are
			 now placed in separate files in the home directory of the user, and those files are
			 sourced only if they are present.  That enables the user to continue to share the usual 
			 init files on multiple machines, even though Macaulay2 may be installed in various different
			 locations."
			 },
		    LI {"A new division algorithm has been implemented in rings with monomials less than 1,
			 e.g., where the monomials can involve negative exponents, and hence do not form a well-ordered set.
			 See ", TO "division in polynomial rings with monomials less than 1", "."
			 },
		    LI {"A bug in ", TO "irreducibleCharacteristicSeries", ", upon with ", TO "MinimalPrimes :: minimalPrimes", "
			 depends, was fixed.  Now the new ring supporting the characteristic series will
			 have variables with the same names and degrees, but the ordering of the variables
			 and the monomial ordering will be different.  This ensures that homogeneity will
			 be preserved.  Also, for convenience, the routine
			 now returns a sequence, instead of a list, suitable for immediate parallel assignment."
			 },
		    LI {"The function ", TO "part", " has been altered so that for multigraded rings, it does not use the first component
			 of the degree vector.  New functionality has been added, and the method for ", TT "part(Sequence,RingElement)", "
			 has been removed."
			 },
		    LI {"Heft vectors are now automatically computed, see ", TO "heft vectors", ".  Users who specify
			 the Heft option explicitly may be able to avoid that now."},
		    LI {"The description of a ring provided by ", TO "describe", " is now abbreviated by making use of
			 run length encoding."
			 },
		    LI {"Browsers started by ", TO "viewHelp", " are now run in a separate process group
			 so they don't die when Macaulay2 terminates."
			 },
		    LI {"The function ", TO "prune", " and ", TO "decompose", " are no longer exact
			 synonyms of ", TO "minimalPresentation", " and ", TO "MinimalPrimes :: minimalPrimes", ", respectively."
			 },
		    LI {"The function ", TO "get", " has been fixed so it returns an error message if the process associated with the pipe has died."},
		    LI {"The function ", TO "searchPath", " now does what the documentation said it would do."},
		    LI {"The output operation ", TT "s<<x", ", when ", TT "s", " is a string, has been changed
			 so that if a file with filename ", TT "s", " is already open, that file will be used
			 instead of opening a new file with the same name, erasing the data already written
			 to the file."
			 },
		    LI {"Tensor product of a module with a ring has been modified so it will make a ring map
			 between the two rings that is derived from the names of the variables."
			 },
		    LI {
			 "The degrees in symmetric algebras have been corrected."
			 },
		    LI {
			 "The default for polynomial rings over polynomial rings is now to join
			 the degree vectors of monomials in the base to the degree vectors of
			 the top level monoid, usually resulting in a multigraded ring.  For example,
			 QQ[x][y] is now bigraded."
			 },
		    LI {
			 "Inverting a noninvertible matrix results in an error message now."
			 },
		    LI {
			 "The function ", TO "export", ", given a string (rather than a symbol) will now make a new
			 symbol with that name, even if a symbol with the same name already exists 
			 in another visible package."
			 },
		    LI {
			 "The function ", TO "basis", " will now check finite dimensionality in advance, to avoid running out of memory."
			 },
		    LI {
			 "Functions and types associated with hypertext and documentation have been isolated in a new package
			 called ", TO2{"Text::Text","Text"}, ", which gets loaded automatically by ", TO "beginDocumentation", "."
			 },
		    LI {
			 TT "errorCode", " has been renamed to ", TO "current"
			 },
		    LI {
			 "The file layout system, as described by ", TO "Layout", ", formerly called ", TT "LAYOUT", ", now 
			 supports separation of architecture independent files from architecture dependent files."
			 },
		    LI {
			 "The cross reference hyperlinks in the info form of the documentation have been improved,
			 but we recommend reading it in Emacs with ", KBD "M-x info", ", configuring the Emacs
			 variable ", TT "Info-hide-note-references", " so its value is ", TT "hide", ".
			 See ", TO "reading the documentation", "."
			 },
		    LI {
			 "Now the function ", TO "needs", " will reload the requested file not only if the file has
			 not been loaded before, but also if it has changed since the previous time."
			 },
		    LI {
			 "It is now possible to represent a series of three or more slashes within a string delimited by
			 ", TO "///", " by typing a longer series."
			 },
		    LI {
			 "The conversion of ", TO "TEX", " to html has been improved and documented, see ", TO "Text::html(TEX)", "."
			 },
		    LI {
			 "Unicode, encoded in ", TT "utf-8", " format, is supported in documentation pages, both in html form and in 
			 Emacs info form: 你好."
			 },
		    LI {
			 "When an error occurs within a string being evaluated with ", TO "value", ", the 
			 appropriates lines of the string will be displayed if the debugger is entered."
			 },
		    LI {
			 "A new method for ", TO "substring", " accepts a pair of integers as first argument
			 of the sort returned by ", TO "regex", "."
			 },
		    LI {
			 "Regular expression handling, by the functions ", TO "regex", ", ", TO "match", ", ", TO "replace", ", and ", TO "select", ",
			 is now much faster because strings are not copied."
			 },
		    LI {
			 "The function ", TO "regex", " now has a form that restricts the range of the search."
			 },
		    LI {
			 "Macaulay2 now incorporates ", TO "frobby", ", a free library for computing
			 the Alexander dual of a monomial ideal (see ", TO (dual,MonomialIdeal), ")."
			 },
		    LI {
			 "The function ", TO "select", " will now give an error message if the
			 function provided to it returns something neither ", TO "true", " nor ", TO "false", "."
			 },
		    LI {
			 "The quotient and remainder for two ring elements can now be obtained simultaneously,
			 saving time.  See ", TO (quotientRemainder,RingElement,RingElement), "."
			 },
		    LI {
			 "The binary representation of a real number is now available using ", TO (promote,RR,QQ), ".
			 The code for ", TO (lift,RR,QQ), " has been tightened up so a rational number is provided
			 that provides exactly the same real number when promoted."
			 },
		    LI {
			 "The Emacs commands ", KBD "M-x M2", ", bound to ", KBD "F12", ", and ", TT "M2-send-to-program",
			 ", bound to ", KBD "F11", ", have some new capability.
			 With prefix argument ", KBD "C-u C-u", " to ", KBD "M-x M2", ", the tag from which the buffer name is constructed (by
			 prepending and appending asterisks) can be entered in the minibuffer.
		         With a prefix argument to ", TT "M2-send-to-program", ", the name of
			 the buffer to which this and future uses of the command (in this buffer) should
			 be sent can be entered, with history."
			 },
		    LI {
			 "The function ", TO "symmetricAlgebra", " is now functorial."
			 }
		    }
	       }
	  }
     }

document {
     Key => "changes, 1.0 and 1.1",
     PARA ///
     Versions have been compiled specifically for the following GNU/Linux
     systems: generic Linux, Ubuntu (32 bit and 64 bit), Debian (32 bit and 64
     bit) both with *.deb files, Fedora 7, Fedora 8, and Red Hat Enterprise 4,
     with *.rpm files; for the following Macintosh OS X systems: 10.4 and 10.5
     on Intel 32 bit, 10.5 on Intel 64 bit, and 10.4 on the Power PC; and on
     Microsoft Windows with the Cygwin compatibility package installed.
     Automatic installation from our repositories is possible for Debian,
     Ubuntu, and Microsoft Windows.  The files for downloading are now divided
     into two archives, depending on whether they depend on the architecture.
     ///,
     PARA {
	  "Packages have been contributed: ", 
	  TO2{ "NoetherNormalization::NoetherNormalization","NoetherNormalization"},
	  ", by Bart Snapp and Nathaniel Stapleton;
	  ", TO2{"GenericInitialIdeal::GenericInitialIdeal","GenericInitialIdeal"}, " and
	  ", TO2{"Regularity::Regularity","Regularity"}, ",
	  by Alexandra Seceleanu and Nathaniel Stapleton;
	  ", TO2{"InvolutiveBases::InvolutiveBases","InvolutiveBases"}, ", by Daniel Robertz;
	  ", TO2{"ChainComplexExtras::ChainComplexExtras","ChainComplexExtras"}, ", by Frank Moore and Greg Smith;
	  ", TO2{"HyperplaneArrangements::HyperplaneArrangements","HyperplaneArrangements"}, ", by Graham Denham and Gregory G. Smith;
	  ", TO2{"LexIdeals::LexIdeals","LexIdeals"}, ", by Chris Francisco;
	  ", TO2{"ReesAlgebra::ReesAlgebra","ReesAlgebra"}, ", by David Eisenbud, Amelia Taylor, and Sorin Popescu; and
	  ", TO2{"TangentCone::TangentCone","TangentCone"}, ", by Craig Huneke and David Eisenbud."
	       },
     PARA {"A good implementation of real and complex numbers to arbitrary precision,
	  based on the mpfr library from ", HREF "http://mpfr.org/", ", has been implemented.  The
	  library is remarkable for the care taken to return correctly rounded
	  results.  It is hoped that this will form a good base for experimentation
	  with algebraic algorithms that mix symbolic and numeric techniques.  Basic
	  transcendental functions are also provided, and pi is now a symbolic
	  constant usable in numeric expressions of any precision.  An interface to
	  LAPACK routines for singular value decomposition and eigenvectors is
	  provided (but they operate only with 53 bits of precision).
	  "},
     PARA ///
     An interface with TeXmacs has been provided, so Macaulay2 can be run with
     a good graphical user interface.  More work remains to be done, but it is
     usable.
     ///,
     PARA ///
     Documentation has been improved, with every function documented.
     ///,
     PARA ///
     Computation of Gröbner bases over local rings has been improved.  New
     notation QQ{x,y,z} for local rings.  More precisely
     ///,
     PARA ///
     The default (GRevLex) monomial ordering in polynomial rings whose
     variables don't all have degree 1 was fixed to take the degrees into
     account.  More precisely, the ordering now uses the values obtained by
     scalar product of the provided heft vector with the degree vector.
     ///,
     PARA ///
     The implementation of the Gröbner basis algorithm for polynomial rings
     where the multidegrees of the variables don't all have strictly positive
     first component has been fixed by having it use the heft vector provided.
     The problem was that bases were not minimalized, and S-pairs were
     addressed in a non-optimal order.  (The total Ext functor Ext(M,N) used
     this facility and was returning wrong answers.)
     ///,
     PARA ///
     A bug in division (f//g) resulting in incorrect answers over quotient
     rings was fixed.
     ///,
     PARA {"A bug in ", TO "trim", " and ", TO "mingens", " resulting in incorrect answers was fixed."},
     PARA ///
     A bug in computation of the Gröbner basis of an exterior algebra over Z
     was fixed.
     ///,
     PARA {
	  "A bug in fraction division was fixed.  Fraction field code now checks for
     	  non-units in many more places.  For rings that have been declared by the
     	  user to be fields, and yet are not fields, attempting to divide by a
     	  non-unit results in an error, and sets a value so that the function
     	  ", TO "getNonUnit", " returns that value."
	  },
     PARA ///
     The Gröbner basis routine can now handle large monomial ideals without a
     stack overflow.
     ///,
     PARA {"The function ", TO "monomialIdeal", ", over polynomial rings over ", TO "ZZ", ", now incorporates
     	  leading monomials with nonzero coefficients.  Formerly the coefficients
     	  had to be units."
	  },
     PARA ///
     Codimension (and dimension) computations over polynomial rings over Z work
     once again.
     ///,
     PARA ///
     The speed of computation of projective resolutions when the first
     components of the degrees of the variables are not necessarily positive has
     been improved.
     ///,
     PARA ///
     The interpreter has been fixed so it more often detects extreme recursion;
     one case was omitted that allowed the machine stack to overflow with a
     segmentation fault.
     ///,
     PARA ///
     The function "betti" now returns a new type of object of class BettiTally,
     which can be manipulated with the operations that can manipulate chain
     complexes.
     ///,
     PARA {"Support for utf-8 encoding of unicode characters in strings provided via ", TO "utf8", "."},
     PARA {"A new function ", TO "scanLines", " can be used for reading a big file one line at a time."},
     PARA ///A new format for multi-line block comments is {* ... *}.///,
     PARA ///M2 can now be run with script files by using///,
     PRE ///       #! /usr/bin/M2 --script///, 
     PARA ///as the first line of the script file.///,
     PARA ///
     Under Microsoft Windows, the links in the html form of the documentation
     now work in such a way that browsers can follow them, and viewHelp now
     works (if it finds firefox).
     ///,
     PARA {
	  "Here are the functions added to the Core package since 0.9.95: ",
	  TO "acosh", ", ",
	  TO "acot", ", ",
	  TO "agm", ", ",
	  TO "ancestors", ", ",
	  TO "asinh", ", ",
	  TO "atan2", ", ",
	  TO "BesselJ", ", ",
	  TO "BesselY", ", ",
	  TO "clean", ", ",
	  TO "commonest", ", ",
	  TO "commonRing", ", ",
	  TO "cot", ", ",
	  TO "coth", ", ",
	  TO "cpuTime", ", ",
	  TO "csc", ", ",
	  TO "csch", ", ",
	  TO "debugError", ", ",
	  TO "default", ", ",
	  TO "eint", ", ",
	  TO "erf", ", ",
	  TO "erfc", ", ",
	  TO "expm1", ", ",
	  TO "fillMatrix", ", ",
	  TO "Gamma", ", ",
	  TO "gbRemove", ", ",
	  TO "gbSnapshot", ", ",
	  TO "getSymbol", ", ",
	  TO "globalAssign", ", ",
	  TO "httpHeaders", ", ",
	  TO "installHilbertFunction", ", ",
	  TO "instances", ", ",
	  TO "isANumber", ", ",
	  TO "isFinite", ", ",
	  TO "isInfinite", ", ",
	  TO "isReal", ", ",
	  TO "lngamma", ", ",
	  TO "log1p", ", ",
	  TO "LUdecomposition", ", ",
	  TO "markedGB", ", ",
	  TO "norm", ", ",
	  TO "openOutAppend", ", ",
	  TO "parts", ", ",
	  TO "powermod", ", ",
	  TO "scanLines", ", ",
	  TO "sec", ", ",
	  TO "sech", ", ",
	  TO "seeParsing", ", ",
	  TO "setupEmacs", ", ",
	  TO "size2", ", ",
	  TO "toCC", ", ",
	  TO "toRR", ", ",
	  TO "utf8", ", ",
	  TO "wikipedia", ", and ",
	  TO "zeta", "."
	  },
     PARA ///
     Compilation of Macaulay2 from source has been improved.  Needed third
     party libraries will now be downloaded and compiled automatically if they
     are not already provided.
     ///,
     PARA ///
     More tests have been added (to verify, after compilation, that M2 is
     working as expected).
     ///
     }

-- Local Variables:
-- compile-command: "make -C $M2BUILDDIR/Macaulay2/packages PACKAGES=Macaulay2Doc RemakePackages=false RemakeAllDocumentation=false IgnoreExampleErrors=false"
-- End:
