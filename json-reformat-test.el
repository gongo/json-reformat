(require 'ert)
(require 'json-reformat)

(ert-deftest json-reformat-test:indent ()
  (should (string= "" (json-reformat:indent 0)))
  (should (string= "    " (json-reformat:indent 1)))
  (should (string= "        " (json-reformat:indent 2)))
  )

(ert-deftest json-reformat-test:number-to-string ()
  (should (string= "1" (json-reformat:number-to-string 1)))
  (should (string= "100" (json-reformat:number-to-string 100)))
  (should (string= "-1" (json-reformat:number-to-string -1)))
  )

(ert-deftest json-reformat-test:symbol-to-string ()
  (should (string= "true" (json-reformat:symbol-to-string t)))
  (should (string= "false" (json-reformat:symbol-to-string :json-false)))
  (should (string= "foo" (json-reformat:symbol-to-string 'foo)))
  (should (string= ":bar" (json-reformat:symbol-to-string :bar)))
  )

(ert-deftest json-reformat-test:vector-to-string ()
  (should (string= "\
\[
    1,
    2,
    3
\]" (json-reformat:vector-to-string [1 2 3] 0)))

  (should (string= "\
\[
        \"foo\",
        \"bar\",
        3
    \]" (json-reformat:vector-to-string ["foo" "bar" 3] 1)))

  (should (string= "\
\[
    1,
    \[
        2,
        \[
            3,
            4
        \],
        5
    \],
    6,
    []
\]" (json-reformat:vector-to-string [1 [2 [3 4] 5] 6 []] 0)))
  )

(ert-deftest json-reformat-test:decode-string ()
  (should (string= "\"foobar\"" (json-reformat:decode-string "foobar")))
  (should (string= "\"♡\"" (json-reformat:decode-string "\u2661")))
  )

(ert-deftest json-reformat-test:print-node ()
  (should (string= "null" (json-reformat:print-node nil 0)))
  )

(ert-deftest json-reformat-test:tree-to-string ()
  (should (string= "\
{
    \"info\": {
        \"male\": true
    },
    \"age\": 33,
    \"name\": \"John Smith\"
}" (json-reformat:tree-to-string
    '("info" ("male" t) "age" 33 "name" "John Smith") 0)))
  )

(ert-deftest json-reformat-test:json-reformat-region ()
  (should (string= "\
{
    \"breakfast\": \[
        \"milk\",
        \"bread\",
        \"egg\"
    \],
    \"age\": 33,
    \"name\": \"John Smith\"
}" (with-temp-buffer
     (insert "{\"name\": \"John Smith\", \"age\": 33, \"breakfast\":\[\"milk\", \"bread\", \"egg\"\]}")
     (json-reformat-region (point-min) (point-max))
     (buffer-string))))

  (should (string= "\
\[
    {
        \"foo\": \"bar\"
    },
    {
        \"foo\": \"baz\"
    }
\]" (with-temp-buffer
     (insert "[{ \"foo\" : \"bar\" }, { \"foo\" : \"baz\" }]")
     (json-reformat-region (point-min) (point-max))
     (buffer-string)))))
