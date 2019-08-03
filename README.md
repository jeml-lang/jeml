# JEML

Judah's Easy Minimal Language

Latest Version: [v1.1.0](https://github.com/jeml-lang/jeml/tree/v1.1.0)

*Notice: JEML and its specification are subject to change. Because of this, any feedback is welcome :)*

## Reasoning

JEML's main goal is to be an efficient, human-readable configuration language with easily parsable syntax.
To accomplish this, JEML does away with things like `=`, `:`, and other symbols that can lead to clutter.

## Example

This example can also be seen [here](tests/test.jeml). 

```jeml
  # This is a JEML file! 
  creator {
    name "Judah Caruso-Rodriguez"
    description "Creator of the JEML specification :)"
    website "https://0px.moe"
  }
  
  project {
    name "Example Project"
    version "0.0.1"
    authors [ "Cool Person <email@email.email>" ]
    description "A cool project for cool people"
    license "MIT"
    keywords [ "project" "jeml" "cool" ]
    url "https://project.io/project"
    build {
      name "project"
      path "src/project.ext"
    }
    dependencies {
      jeml { version "1.0.0" flags ["do-thing"] }
      toml { version "0.5.0" windows_only? true }
      yaml { version "1.3.0" optional? true }
    }
    dev-dependencies {
      reflect "1.4.0"
    }
  }
```

JEML tries to merge the simplicity of TOML with the structure of JSON.
Thus allowing you to keep the hierarchical structure you're used to, minus the clutter.


## Specification
- Keys are **case sensitive**. Meaning `foo`, `Foo`, and `fOO` are all separate things.
- Valid whitespace characters are `U+0009` (tab) and `U+0020` (space).

### Comments

Comments are written using `#` for inline and `###` for multi-line. 

```jeml
  ###
  We can put whatever we want in here and it won't be parsed!
  
  int
  main(int arc, char** argv)
  {
    printf("Hello, World!"); // See, nothing!
    return 0;
  }
  ###
  
  map {
    foo "bar" # and this is an inline comment!
  }
```

### Maps 

Maps (otherwise known as hash tables, hash maps, or dictionaries) are how JEML handles key/value pairs.
We create a map like so:

```jeml
  an_empty_map {}
```

Values inside maps are assigned with a key and a value, separated by whitespace.
JEML doesn't use '=' or ':' to assign values to keys, instead keys take the value that comes directly after them. Think Scheme/Lisp.

```jeml
  non_empty_map {
    a_key "a value"
    another_key 3.1415
  }
```

This also works inline, no change in syntax is needed! JEML knows which keys go to which values.

```jeml
  inline_map { inline_key1 "wow inline!" inline_key2 ["a list!"] }
```

Maps can also be nested like so:

```jeml
  parent {
    I-belong-to-parent? true
    child {
      I-belong-to-child? true
      child_child {
        I-belong-to-child_child? true
      }
    }
  }
```

In JSON:  

```json
  {
    "parent": {
      "I-belong-to-parent?": true,
      "child": {
        "I-belong-to-child?": true,
        "child_child": {
          "I-belong-to-child_child?": true
        }
      }
    }
  }
```


### Lists
In JEML, lists are similar to maps. However, lists don't use keys,
just values. Lists are also heterogeneous, meaning their values can be of any type.
Lists, however, are not standalone like maps. They must be assigned to a key or
belong to a structure, like a map or another list. 

```jeml
  map {
    list [1 2 3 "apple" "banana" "cherry" {foo 1}]
  }
```

Once again, whitespace is used. However, this time it's used to separate values inside the list.
Lists can also be nested like maps using the same syntax.

```jeml
  nested_lists {
    list_of_empty_lists [ [] [] [] [] [] [] ]
    list_of_partially_filled_lists [ [1] [] [1 2] [3] [] [] ]
  }
```


### Types

**Booleans**   
Booleans are always lowercase, as it should be!

```jeml
  booleans {
    True? true
    False? false
  }
```

**Strings**  

There are two types of strings in JEML:  
  - Inline
  - Multi-line

```jeml
  strings {
    inline      "Hello, this is a string"
    escaped     "\tThis string contains \"cool\" escaped characters\n"
    multi-line  """
      Wow, what a string!
      It's on a bunch of different lines! Truley astonishing.
    """
  }
```

Multi-line strings are also 1:1 representations, meaning things like this
work without having to fight against anyone/anything.

```jeml
  string_literals {
    windows_path  """C:\Users\Person\Projects\New Project\"""
    with_quotes   """Your editor's syntax highlighting "loves" this idea"""
    regular_expr  """/[a-zA-Z]{1,}\[a-zA-Z]{1,}/"""
  }
```


**Integers**  

Integers more-than zero are positive, integers less-than zero are negative
and should be prefixed by a minus '-' character.

```jeml
  integers {
    positive 140
    negative -1
  }
```

For large numbers, an underscore ('_') character can be used in place of a comma.

```jeml
  large_integers {
    pretty_big 1_000
    even_bigger 1_000_000
    super_large 999_999_999
  }
```  

**Floating-point numbers**  

Floats are built similarly to integers. However, they may also be suffixed
by a fractional part (decimal) and/or an exponent part.

```jeml
  floats {
    pi 3.1415927
    const 0.0000000000667
    small -0.0001
    exponents {
      foo -4.116e5
      bar 455E-3
      fiz 3.14e-33
    }
  }
```


**Complex numbers**  

JEML supports Hexidecimal, Binary, and Octal numbers by default using the `0x`, `0b`, and `0o` prefixes respectively.  

```jeml
  complex {
    binary 0b01001
    hexidecimal 0x4f
    octal 0o245
  }
```


## Implementations  

If you have an implementation, submit a pull request, adding it to this section!   

* Python - https://github.com/jeml-lang/jeml-py


## Contributing

Did you find something wrong with spec? Do you have an idea about how to improve JEML? Just want to say hi?  

Submit an issue or a pull request with your improvements or suggestions! 

## Inspirations
- [TOML (Tom's Obvious, Minimal Language)](https://github.com/toml-lang/toml/) (obviously)

