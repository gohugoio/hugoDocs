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
      spacing: {
        "2/3": "66.666667%",
      },
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
      // Partly from  https://tailwind.simeongriggs.dev/organge/EBB951
      colors: {
        primarydark: colorPrimaryDark,
        primarylight: colorPrimaryLight,
        blue: {
          50: "#B5E8FD",
          100: "#9CE1FC",
          200: "#6AD2FB",
          300: "#3EC4F9",
          400: "#0CB5F8",
          500: "#0694CB",
          600: "#0585B7",
          700: "#0577A4",
          800: "#04658B",
          900: "#035677",
        },
        green: {
          50: "#C7F0E3",
          100: "#B3EADA",
          200: "#93E1CA",
          300: "#6FD7B8",
          400: "#4BCDA6",
          500: "#33B991",
          600: "#2DA480",
          700: "#289071",
          800: "#227C61",
          900: "#1C644E",
        },
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
        orange: {
          50: "#F8E8C4",
          100: "#F7E2B6",
          200: "#F4D99F",
          300: "#F1CE83",
          400: "#EEC56D",
          500: "#EBB951",
          600: "#E9B33F",
          700: "#E6AA28",
          800: "#E0A11A",
          900: "#C99117",
        },
        hotpink: {
          50: "#FFBDD6",
          100: "#FFADCD",
          200: "#FF94BD",
          300: "#FF75AA",
          400: "#FF5C9A",
          500: "#FF3F88",
          600: "#FF297B",
          700: "#FF0F6B",
          800: "#FA0060",
          900: "#E00056",
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
