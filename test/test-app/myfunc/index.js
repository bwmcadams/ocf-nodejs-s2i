
module.exports = function(ctx) {
  console.log( "fun fun fun");
  ctx.done(null, { hello: "world" } );
}
