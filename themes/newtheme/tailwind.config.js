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
          50: "#E1F6FE",
          100: "#C4EDFD",
          200: "#88DBFC",
          300: "#52CAFA",
          400: "#16B8F8",
          500: "#0694CB",
          600: "#0577A4",
          700: "#045A7C",
          800: "#02394F",
          900: "#011D28",
        },
        green: {
          50: "#EBF9F5",
          100: "#D3F3E9",
          200: "#ABE8D6",
          300: "#7FDCC0",
          400: "#53D0AA",
          500: "#33B991",
          600: "#299474",
          700: "#1F7058",
          800: "#154C3B",
          900: "#0A241C",
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
          50: "#FDF8ED",
          100: "#FBF1DA",
          200: "#F7E4BA",
          300: "#F3D596",
          400: "#EFC976",
          500: "#EBB951",
          600: "#E5A51A",
          700: "#A97A13",
          800: "#72520D",
          900: "#372806",
        },
        pink: {
          50: "#FFEBF2",
          100: "#FFD6E6",
          200: "#FFB3D0",
          300: "#FF8AB7",
          400: "#FF66A1",
          500: "#FF3F88",
          600: "#FF0062",
          700: "#BD0048",
          800: "#800031",
          900: "#3D0017",
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
