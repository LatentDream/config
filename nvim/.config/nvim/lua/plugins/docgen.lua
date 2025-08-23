return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  opts = {
    enabled = true,
    languages = {
      javascript = {
        template = {
          annotation_convention = "jsdoc"
        }
      },
      typescript = {
        template = {
          annotation_convention = "tsdoc"
        }
      },
      python = {
        template = {
          annotation_convention = "numpydoc"
        }
      },
      go = {
        template = {
          annotation_convention = "godoc"
        }
      },
      rust = {
        template = {
          annotation_convention = "rustdoc"
        }
      },
      c = {
        template = {
          annotation_convention = "doxygen"
        }
      }
    }
  },
  keys = {
    { "<Leader>jd", function() require("neogen").generate() end, desc = "Generate JSDoc" },
  },
}
