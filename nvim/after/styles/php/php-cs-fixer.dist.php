<?php

$config = new PhpCsFixer\Config();
return $config
    ->setRules([
        '@PhpCsFixer' => true,
        'indentation_type' => true,
        'array_indentation' => true,
        'binary_operator_spaces' => true,
        'method_chaining_indentation' => true,
        'no_extra_blank_lines' => true,
        'echo_tag_syntax' => [
          "format" => "short"
        ],
    ])
    ->setIndent("  ") // 2 spaces
    ->setLineEnding("\n");
