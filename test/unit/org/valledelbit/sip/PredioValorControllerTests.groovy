package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(PredioValorController)
@Mock(PredioValor)
class PredioValorControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/predioValor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.predioValorInstanceList.size() == 0
        assert model.predioValorInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.predioValorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.predioValorInstance != null
        assert view == '/predioValor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/predioValor/show/1'
        assert controller.flash.message != null
        assert PredioValor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/predioValor/list'


        populateValidParams(params)
        def predioValor = new PredioValor(params)

        assert predioValor.save() != null

        params.id = predioValor.id

        def model = controller.show()

        assert model.predioValorInstance == predioValor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/predioValor/list'


        populateValidParams(params)
        def predioValor = new PredioValor(params)

        assert predioValor.save() != null

        params.id = predioValor.id

        def model = controller.edit()

        assert model.predioValorInstance == predioValor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/predioValor/list'

        response.reset()


        populateValidParams(params)
        def predioValor = new PredioValor(params)

        assert predioValor.save() != null

        // test invalid parameters in update
        params.id = predioValor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/predioValor/edit"
        assert model.predioValorInstance != null

        predioValor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/predioValor/show/$predioValor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        predioValor.clearErrors()

        populateValidParams(params)
        params.id = predioValor.id
        params.version = -1
        controller.update()

        assert view == "/predioValor/edit"
        assert model.predioValorInstance != null
        assert model.predioValorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/predioValor/list'

        response.reset()

        populateValidParams(params)
        def predioValor = new PredioValor(params)

        assert predioValor.save() != null
        assert PredioValor.count() == 1

        params.id = predioValor.id

        controller.delete()

        assert PredioValor.count() == 0
        assert PredioValor.get(predioValor.id) == null
        assert response.redirectedUrl == '/predioValor/list'
    }
}
