const { Cli } = require('@mhio/test-cli')
const debug = require('debug')('mhio:test:short:kubectl')

describe('unit::short::kubectl', function(){

  it('should output help to stdout from binary', function(){
    return Cli.run(['../k', 'h']).then(result => {
      expect(result).to.have.property('errors').and.to.eql([])
      debug('bin out', result.stdout)
      debug('bin err', result.stderr)
      expect( result.stdout[0] ).to.contain( 'the (k)ubectl function' )
      expect( result.stderr ).to.eql([])
      expect(result).to.have.property('exit_code').and.equal(0)
    })
  })

})

