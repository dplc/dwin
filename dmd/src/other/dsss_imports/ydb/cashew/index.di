/*****************************************************************************************
 *  A collection of small, simple, useful utilities.
 *
 *  $(CASHEW_HEAD)
 *  <b>Authors, Contributors, and Acknowledgements:</b><br />
 *    Christopher Nicholson-Sauls<br />
 *    Dustin Pate<br />
 *    Mikola Lysenko<br />
 *    Reiner Pope<br />
 *    David Medlock<br />
 *    Sean Kelly<br />
 *    David Qualls<br />
 *    Bill Baxter
 *    
 *
 *  <b>Current branches of the Cashew tree</b>
 *  <dl>
 *      <dt>CashewCGI</dt><dd>
 *          Utilities for working with queries, HTML, etc.
 *      </dd>
 *      <dt>CashewJSON</dt><dd>
 *          Working with JSON ('JavaScript' Object Notation) formatted data.
 *          For more information visit
 *          <a href="http://www.json.org/">http://www.json.org/</a>!
 *      </dd>
 *      <dt>CashewSys</dt><dd>
 *          System utilities.
 *      </dd>
 *      <dt>CashewUtils</dt><dd>
 *          General utility functions and other entities.
 *      </dd>
 *      <dt>CashewXML</dt><dd>
 *          Simplistic XML capabilities using hierarchies of element objects.
 *          <i>Not yet fully implemented.</i>
 *      </dd>
 *  </dl>
 */
module ydb.cashew.index ;
// note this file is only here for documentation purposes

public import ydb.cashew.cgi   .UrlEncode     ;
public import ydb.cashew.json  .Exception     ;
public import ydb.cashew.json  .Parser        ;
public import ydb.cashew.json  .Value         ;
public import ydb.cashew.utils .Array         ;
public import ydb.cashew.utils .Benchmark     ;
public import ydb.cashew.utils .Binary        ;
public import ydb.cashew.utils .Sfv           ;
public import ydb.cashew.utils .UTest         ;
public import ydb.cashew.sys   .Environment   ;

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
