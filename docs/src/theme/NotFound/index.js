import React from 'react';
import Translate, {translate} from '@docusaurus/Translate';
import {PageMetadata} from '@docusaurus/theme-common';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';

export default function NotFound() {
  return (
    <>
      <PageMetadata
        title={translate({
          id: 'theme.NotFound.title',
          message: 'Page Not Found',
        })}
      />
      <Layout>
        <main className="container margin-vert--xl">
          <div className="row">
            <div className="col col--6 col--offset-3">
              <div style={{textAlign: 'center'}}>
                <h1 style={{fontSize: '6rem', marginBottom: '0'}}>
                  🔍
                </h1>
                <h1 className="hero__title">
                  <Translate
                    id="theme.NotFound.title"
                    description="The title of the 404 page">
                    Page Not Found
                  </Translate>
                </h1>
                <p style={{fontSize: '1.25rem', color: 'var(--ifm-color-content-secondary)'}}>
                  <Translate
                    id="theme.NotFound.p1"
                    description="The first paragraph of the 404 page">
                    We couldn't find what you were looking for.
                  </Translate>
                </p>
                <p style={{color: 'var(--ifm-color-content-secondary)'}}>
                  <Translate
                    id="theme.NotFound.p2"
                    description="The second paragraph of the 404 page">
                    The page might have been moved, deleted, or maybe it never existed.
                  </Translate>
                </p>

                <div style={{
                  display: 'flex',
                  flexDirection: 'column',
                  gap: '1rem',
                  marginTop: '2rem',
                  alignItems: 'center',
                }}>
                  <Link
                    className="button button--primary button--lg"
                    to="/">
                    <Translate
                      id="theme.NotFound.homeButton"
                      description="Button to go to homepage">
                      🏠 Go to Homepage
                    </Translate>
                  </Link>
                  <Link
                    className="button button--secondary button--lg"
                    to="/docs">
                    <Translate
                      id="theme.NotFound.docsButton"
                      description="Button to go to documentation">
                      📚 Browse Documentation
                    </Translate>
                  </Link>
                </div>

                <div style={{
                  marginTop: '3rem',
                  padding: '1.5rem',
                  background: 'var(--ifm-background-surface-color)',
                  borderRadius: '8px',
                }}>
                  <h3 style={{marginBottom: '1rem'}}>
                    <Translate
                      id="theme.NotFound.helpTitle"
                      description="Title for help section">
                      Looking for something specific?
                    </Translate>
                  </h3>
                  <div style={{
                    display: 'flex',
                    flexWrap: 'wrap',
                    gap: '0.5rem',
                    justifyContent: 'center',
                  }}>
                    <Link to="/docs/guides/GETTING_STARTED" className="button button--outline button--sm">
                      Getting Started
                    </Link>
                    <Link to="/docs/guides/EDITORCONFIG_GUIDE" className="button button--outline button--sm">
                      EditorConfig Guide
                    </Link>
                    <Link to="/docs/reference/contributing" className="button button--outline button--sm">
                      Contributing
                    </Link>
                    <Link
                      to="https://github.com/leonwong282/awesome-project-template/issues"
                      className="button button--outline button--sm">
                      Report an Issue
                    </Link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      </Layout>
    </>
  );
}
