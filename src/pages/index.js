import clsx from "clsx";
import Link from "@docusaurus/Link";
import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import Layout from "@theme/Layout";

import Heading from "@theme/Heading";
import styles from "./index.module.css";
import "../css/custom.css";

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  
  return (
    <header className={clsx("hero hero--primary", styles.heroBanner)}>
       {/* Add the circle animation HTML here */}
       <ul className="circles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
      </ul>
      <div className="container">
        <Heading as="h1" className="hero__title primary_text">
          {siteConfig.title}
        </Heading>
        <p className="hero__subtitle primary_text">{siteConfig.tagline}</p>
        <article class="margin-top--lg">
          <section class="row list_eTzJ">
            <article class="col col--6 margin-bottom--lg">
              <a
                class="card padding--lg cardContainer_fWXF"
                href="/docs/category/website-setup"
              >
                <h2 class="text--truncate cardTitle_rnsV" title="Website Documentation">
                  📄️ Website Documentation
                </h2>
                {/* <p
                  class="text--truncate cardDescription_PWke"
                  title="Add Markdown or React files to src/pages to create a standalone page:"
                >
                  Add Markdown or React files to src/pages to create a
                  standalone page:
                </p> */}
              </a>
            </article>
            <article class="col col--6 margin-bottom--lg">
              <a
                class="card padding--lg cardContainer_fWXF"
                href="/docs/category/admin-setup"
              >
                <h2
                  class="text--truncate cardTitle_rnsV"
                  title="Admin Documentation"
                >
                  📄️ Admin Documentation
                </h2>
                {/* <p
                  class="text--truncate cardDescription_PWke"
                  title="Documents are groups of pages connected through:"
                >
                  Documents are groups of pages connected through:
                </p> */}
              </a>
            </article>
            <article class="col col--6 margin-bottom--lg">
              <a
                class="card padding--lg cardContainer_fWXF"
                href="/docs/category/app-setup"
              >
                <h2
                  class="text--truncate cardTitle_rnsV"
                  title="App Documentation"
                >
                  📄️ App Documentation
                </h2>
                {/* <p
                  class="text--truncate cardDescription_PWke"
                  title="Docusaurus creates a page for each blog post, but also a blog index page, a tag system, an RSS feed..."
                >
                  Docusaurus creates a page for each blog post, but also a blog
                  index page, a tag system, an RSS feed...
                </p> */}
              </a>
            </article>
            <article class="col col--6 margin-bottom--lg">
              <a
                class="card padding--lg cardContainer_fWXF"
                href="/docs/changelog"
              >
                <h2
                  class="text--truncate cardTitle_rnsV"
                  title="change log"
                >
                  📄️ Change Log
                </h2>
                {/* <p
                  class="text--truncate cardDescription_PWke"
                  title="Docusaurus supports Markdown and a few additional features."
                >
                  Docusaurus supports Markdown and a few additional features.
                </p> */}
              </a>
            </article>
            <article class="col col--6 margin-bottom--lg">
              <a
                class="card padding--lg cardContainer_fWXF"
                href="/docs/category/features-overview"
              >
                <h2
                  class="text--truncate cardTitle_rnsV"
                  title="Features"
                >
                  📄️ Features
                </h2>
                {/* <p
                  class="text--truncate cardDescription_PWke"
                  title="Docusaurus is a static-site-generator (also called Jamstack)."
                >
                  Docusaurus is a static-site-generator (also called Jamstack).
                </p> */}
              </a>
            </article>
            <article class="col col--6 margin-bottom--lg">
              <a
                class="card padding--lg cardContainer_fWXF"
                href="/docs/support"
              >
                <h2
                  class="text--truncate cardTitle_rnsV"
                  title="Get supports!"
                >
                  📄️ Get supports!
                </h2>
                {/* <p
                  class="text--truncate cardDescription_PWke"
                  title="You have just learned the basics of Docusaurus and made some changes to the initial template."
                >
                  You have just learned the basics of Docusaurus and made some
                  changes to the initial template.
                </p> */}
              </a>
            </article>
          </section>
        </article>
      </div>
    </header>
  );
}

export default function Home() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout
      title={`${siteConfig.title} -Your On-Demand Service Booking Platform`}
      description={`${siteConfig.title} connects you with trusted local service providers for home services, repairs, maintenance, and professional services. Book verified experts, track appointments, and get instant quotes. Your one-stop platform for all service needs.`}
    >
      <main>
        <HomepageHeader />
      </main>
    </Layout>
  );
}
