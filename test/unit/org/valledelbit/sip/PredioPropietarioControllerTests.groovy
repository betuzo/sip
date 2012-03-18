package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(PredioPropietarioController)
@Mock(PredioPropietario)
class PredioPropietarioControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/predioPropietario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.predioPropietarioInstanceList.size() == 0
        assert model.predioPropietarioInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.predioPropietarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.predioPropietarioInstance != null
        assert view == '/predioPropietario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/predioPropietario/show/1'
        assert controller.flash.message != null
        assert PredioPropietario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/predioPropietario/list'


        populateValidParams(params)
        def predioPropietario = new PredioPropietario(params)

        assert predioPropietario.save() != null

        params.id = predioPropietario.id

        def model = controller.show()

        assert model.predioPropietarioInstance == predioPropietario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/predioPropietario/list'


        populateValidParams(params)
        def predioPropietario = new PredioPropietario(params)

        assert predioPropietario.save() != null

        params.id = predioPropietario.id

        def model = controller.edit()

        assert model.predioPropietarioInstance == predioPropietario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/predioPropietario/list'

        response.reset()


        populateValidParams(params)
        def predioPropietario = new PredioPropietario(params)

        assert predioPropietario.save() != null

        // test invalid parameters in update
        params.id = predioPropietario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/predioPropietario/edit"
        assert model.predioPropietarioInstance != null

        predioPropietario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/predioPropietario/show/$predioPropietario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        predioPropietario.clearErrors()

        populateValidParams(params)
        params.id = predioPropietario.id
        params.version = -1
        controller.update()

        assert view == "/predioPropietario/edit"
        assert model.predioPropietarioInstance != null
        assert model.predioPropietarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/predioPropietario/list'

        response.reset()

        populateValidParams(params)
        def predioPropietario = new PredioPropietario(params)

        assert predioPropietario.save() != null
        assert PredioPropietario.count() == 1

        params.id = predioPropietario.id

        controller.delete()

        assert PredioPropietario.count() == 0
        assert PredioPropietario.get(predioPropietario.id) == null
        assert response.redirectedUrl == '/predioPropietario/list'
    }
}
