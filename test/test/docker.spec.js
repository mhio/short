const { Cli } = require('@mhio/test-cli')
const debug = require('debug')('mhio:test:short:docker')

describe('unit::short::docker', function(){

  it('should output test to stdout from binary', function(){
    return Cli.run(['../d', 'h']).then(result => {
      expect(result).to.have.property('errors').and.to.eql([])
      debug('bin out', result.stdout)
      debug('bin err', result.stderr)
      expect( result.stdout[0] ).to.contain( 'the (d)ocker function - d (b r c i n' )
      expect( result.stderr ).to.have.length(0)
      expect(result).to.have.property('exit_code').and.equal(0)
    })
  })

})

