const theme = require("tailwindcss/defaultTheme");
const typography = require("@tailwindcss/typography");

const colorPrimaryDark = "var(--primary-color-dark)";
const colorPrimaryLight = "var(--primary-color-light)";

// Utils
const round = (num) =>
  num
    .toFixed(7)
    .replace(/(\.[0-9]+?)0+$/, "$1")
    .replace(/\.0$/, "");
const rem = (px) => `${round(px / 16)}rem`;
const em = (px, base) => `${round(px / base)}em`;
const px = (px) => `${px}px`;

module.exports = {
  darkMode: "class", // See https://tailwindcss.com/docs/dark-mode
  important: "#gohugoio", // See https://tailwindcss.com/docs/configuration#important
  plugins: [typography, require("nightwind")],
  theme: {
    nightwind: {
      typography: {
        pre: {
          color: "#f8f8f2",
          backgroundColor: theme.colors.gray[900],
        },
      },
      transitionDuration: false,
    },
    fontFamily: {
      ...theme.fontFamily,
      sans: ["Mulish", ...theme.fontFamily.sans],
    },
    extend: {
      // See https://github.com/tailwindcss/typography/blob/master/src/styles.js
      typography: {
        DEFAULT: {
          css: {
            maxWidth: "80ch",
            fontWeight: "400",
            lineHeight: "1.5",
            strong: {
              fontWeight: "600",
            },
            a: {
              textDecoration: "none",
            },
            h1: {
              fontWeight: "400",
              marginBottom: "1rem",
            },
            h2: {
              fontWeight: "600",
              marginTop: "1.5em",
              marginBottom: "1rem",
            },
            h3: {
              fontWeight: "600",
              marginTop: "1.5em",
              marginBottom: "1rem",
            },
            h4: {
              fontWeight: "600",
              marginTop: "1.5em",
              marginBottom: "1rem",
            },
            blockquote: {
              fontWeight: "400",
              fontStyle: "normal",
              borderLeftWidth: "0.25rem",
              borderLeftColor: theme.colors.gray[300],
              quotes: '"\\201C""\\201D""\\2018""\\2019"',
              marginTop: "1em",
              marginBottom: "1em",
            },
            "blockquote p:first-of-type::before": {
              content: "",
            },
            "blockquote p:last-of-type::after": {
              content: "",
            },
            code: {
              backgroundColor: theme.colors.gray[100],
              fontWeight: "400",
              padding: "0.2em",
              margin: 0,
              fontSize: "85%",
              borderRadius: "3px",
            },
            "code::before": false,
            "code::after": false,
            pre: {
              fontSize: em(14, 16),
              lineHeight: round(24 / 14),
              marginTop: "1em",
              marginBottom: "1em",
              borderRadius: rem(6),
              paddingTop: "1em",
              paddingRight: "1em",
              paddingBottom: "1em",
              paddingLeft: "1em",
            },

            p: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            ol: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            ul: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            li: {
              marginTop: ".5em",
              marginBottom: ".5em",
            },
            "> ul > li p": {
              marginTop: ".5em",
              marginBottom: ".5em",
            },
            "> ul > li > *:first-child": {
              marginTop: "0px",
            },
            "> ul > li > *:last-child": {
              marginBottom: "0px",
            },
            "> ol > li > *:first-child": {
              marginTop: "0px",
            },
            "> ol > li > *:last-child": {
              marginBottom: "0px",
            },
            "ul ul, ul ol, ol ul, ol ol": {
              marginTop: "1em",
              marginBottom: "1em",
            },
            hr: {
              marginTop: "2em",
              marginBottom: "2em",
            },
            "tbody td:first-child": false,
          },
        },
        sm: {
          css: {
            fontSize: rem(14),
            lineHeight: "1.5",
            h1: {
              marginBottom: "1rem",
            },
            h2: {
              fontSize: em(24, 12),
              letterSpacing: "-0.38px",
              marginTop: "1.5em",
              marginBottom: "1rem",
            },
            h3: {
              marginTop: "1.5em",
              marginBottom: "1rem",
            },
            h4: {
              marginTop: "1.5em",
              marginBottom: "1rem",
            },
            "thead tr th": {
              paddingLeft: "1rem",
              paddingRight: "1rem",
              paddingBottom: "0.75rem",
            },
            td: {
              padding: "1rem",
            },
            "tbody td:first-child": {
              paddingLeft: 0,
            },
            "tbody td:last-child": {
              paddingRight: 0,
            },
            "thead th:first-child": {
              paddingLeft: 0,
            },
            "thead th:last-child": {
              paddingRight: "0",
            },
            "thead th": {
              fontSize: rem(16),
            },
            table: {
              fontSize: rem(16),
              lineHeight: round(24 / 16),
            },
            p: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            blockquote: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            pre: {
              marginTop: "1em",
              marginBottom: "1em",
              paddingTop: "1em",
              paddingRight: "1em",
              paddingBottom: "1em",
              paddingLeft: "1em",
            },
            ol: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            ul: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            li: {
              marginTop: ".5em",
              marginBottom: ".5em",
            },
            "> ul > li p": {
              marginTop: ".5em",
              marginBottom: ".5em",
            },
            "> ul > li > *:first-child": {
              marginTop: "0px",
            },
            "> ul > li > *:last-child": {
              marginBottom: "0px",
            },
            "> ol > li > *:first-child": {
              marginTop: "0px",
            },
            "> ol > li > *:last-child": {
              marginBottom: "0px",
            },
            "ul ul, ul ol, ol ul, ol ol": {
              marginTop: "1em",
              marginBottom: "1em",
            },
            hr: {
              marginTop: "2em",
              marginBottom: "2em",
            },
          },
        },
        lg: {
          css: {
            fontSize: rem(16),
            lineHeight: "1.5",
            h1: {
              fontSize: "2em",
              lineHeight: "1.25",
              marginBottom: "1rem",
            },
            h2: {
              fontSize: "1.5em",
              lineHeight: "1.25",
              letterSpacing: "-0.5px",
              marginTop: "1.5em",
              marginBottom: "1rem",
            },
            h3: {
              fontSize: "1.25em",
              lineHeight: "1.25",
              marginTop: "1.5em",
              marginBottom: "1rem",
            },
            h4: {
              fontSize: "1em",
              lineHeight: "1.25",
              marginTop: "1.5em",
              marginBottom: "1rem",
            },
            table: {
              fontSize: rem(14),
              lineHeight: round(24 / 16),
            },
            "tbody td:first-child": {
              paddingLeft: rem(21),
            },
            "tbody td:last-child": {
              paddingRight: rem(21),
            },
            "thead th": {
              fontSize: rem(18),
            },

            // new margins
            p: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            blockquote: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            pre: {
              marginTop: "1em",
              marginBottom: "1em",
              paddingTop: "1em",
              paddingRight: "1em",
              paddingBottom: "1em",
              paddingLeft: "1em",
            },
            ol: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            ul: {
              marginTop: "1em",
              marginBottom: "1em",
            },
            li: {
              marginTop: ".5em",
              marginBottom: ".5em",
            },
            "> ul > li p": {
              marginTop: ".5em",
              marginBottom: ".5em",
            },
            "> ul > li > *:first-child": {
              marginTop: "0px",
            },
            "> ul > li > *:last-child": {
              marginBottom: "0px",
            },
            "> ol > li > *:first-child": {
              marginTop: "0px",
            },
            "> ol > li > *:last-child": {
              marginBottom: "0px",
            },
            "ul ul, ul ol, ol ul, ol ol": {
              marginTop: "1em",
              marginBottom: "1em",
            },
            hr: {
              marginTop: "2em",
              marginBottom: "2em",
            },
            table: {
              fontSize: rem(16),
              lineHeight: round(24 / 16),
            },
            "tbody td:first-child": {
              paddingLeft: rem(21),
            },
            "tbody td:last-child": {
              paddingRight: rem(21),
            },
            "thead th": {
              fontSize: rem(16),
            },
          },
        },
      },
      // Generated on https://tailwind.ink/ based on the old primary color: #0594CB
      colors: {
        primarydark: colorPrimaryDark,
        primarylight: colorPrimaryLight,
        steel: {
          50: "#f2fafc",
          100: "#ddf8fa",
          200: "#b0eef5",
          300: "#7adff2",
          400: "#36c2ec",
          500: "#0594cb",
          600: "#0f7dd3",
          700: "#1363ad",
          800: "#134c7f",
          900: "#113d61",
        },
        royalblue: {
          50: "#f5fafd",
          100: "#e8f4fc",
          200: "#c9e1fb",
          300: "#a7c8fa",
          400: "#799cfa",
          500: "#4b6ef9",
          600: "#354bf5",
          700: "#2c3be0",
          800: "#242fb2",
          900: "#1d278b",
        },
        flamingo: {
          50: "#f4f6fb",
          100: "#eceafb",
          200: "#dacff9",
          300: "#c7b0f9",
          400: "#b484f9",
          500: "#9f57f9",
          600: "#8339f5",
          700: "#652de2",
          800: "#4e26ba",
          900: "#3f2194",
        },
        hotpink: {
          50: "#fcf8f9",
          100: "#fcedf6",
          200: "#f9cdee",
          300: "#f7a4e3",
          400: "#f86dd1",
          500: "#f942bc",
          600: "#f1279a",
          700: "#d01e78",
          800: "#a11a58",
          900: "#7e1643",
        },
        maroon: {
          50: "#fcf9f8",
          100: "#fceff2",
          200: "#fad3e3",
          300: "#f9adcc",
          400: "#fa75a2",
          500: "#fb4a78",
          600: "#f42c53",
          700: "#d62244",
          800: "#a81c37",
          900: "#84182d",
        },
        mango: {
          50: "#fbf7f0",
          100: "#fbeedd",
          200: "#f9ddb6",
          300: "#f6c17c",
          400: "#f5973d",
          500: "#f46e1d",
          600: "#ea4b13",
          700: "#c93817",
          800: "#a22d1b",
          900: "#83251a",
        },
        carrot: {
          50: "#faf6eb",
          100: "#faf1ce",
          200: "#f7e597",
          300: "#f3d052",
          400: "#ecaf1e",
          500: "#e88a0b",
          600: "#d66607",
          700: "#b14c0b",
          800: "#8d3b11",
          900: "#713013",
        },
        orange: {
          50: "#faf8ee",
          100: "#faf5d1",
          200: "#f5eb94",
          300: "#efd94d",
          400: "#e2bb1a",
          500: "#d59a09",
          600: "#b97505",
          700: "#925909",
          800: "#71440e",
          900: "#58360f",
        },
        limegreen: {
          50: "#f8faf7",
          100: "#f2f9e8",
          200: "#e2f3bd",
          300: "#c5e885",
          400: "#82d240",
          500: "#46b71b",
          600: "#309810",
          700: "#2d7813",
          800: "#265a16",
          900: "#1f4616",
        },
        turquoise: {
          50: "#eef9f9",
          100: "#d5f7f5",
          200: "#a7f0e9",
          300: "#6be5dc",
          400: "#26d1c8",
          500: "#0cb7ae",
          600: "#0b9990",
          700: "#107c74",
          800: "#13605a",
          900: "#124e49",
        },
      },
    },
  },
  purge: {
    enabled: process.env.HUGO_ENVIRONMENT === "production",
    content: ["./hugo_stats.json", "./layouts/**/*.html"],
    options: {
      safelist: ["dark", "nightwind"],
    },
    extractors: [
      {
        extractor: (content) => {
          let els = JSON.parse(content).htmlElements;
          return els.tags.concat(els.classes, els.ids);
        },
        extensions: ["json"],
      },
    ],
    mode: "all",
  },
  variants: {
    extend: {
      typography: ["dark"],
    },
  },
};
