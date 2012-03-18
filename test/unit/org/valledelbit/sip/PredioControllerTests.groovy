package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(PredioController)
@Mock(Predio)
class PredioControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/predio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.predioInstanceList.size() == 0
        assert model.predioInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.predioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.predioInstance != null
        assert view == '/predio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/predio/show/1'
        assert controller.flash.message != null
        assert Predio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/predio/list'


        populateValidParams(params)
        def predio = new Predio(params)

        assert predio.save() != null

        params.id = predio.id

        def model = controller.show()

        assert model.predioInstance == predio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/predio/list'


        populateValidParams(params)
        def predio = new Predio(params)

        assert predio.save() != null

        params.id = predio.id

        def model = controller.edit()

        assert model.predioInstance == predio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/predio/list'

        response.reset()


        populateValidParams(params)
        def predio = new Predio(params)

        assert predio.save() != null

        // test invalid parameters in update
        params.id = predio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/predio/edit"
        assert model.predioInstance != null

        predio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/predio/show/$predio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        predio.clearErrors()

        populateValidParams(params)
        params.id = predio.id
        params.version = -1
        controller.update()

        assert view == "/predio/edit"
        assert model.predioInstance != null
        assert model.predioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/predio/list'

        response.reset()

        populateValidParams(params)
        def predio = new Predio(params)

        assert predio.save() != null
        assert Predio.count() == 1

        params.id = predio.id

        controller.delete()

        assert Predio.count() == 0
        assert Predio.get(predio.id) == null
        assert response.redirectedUrl == '/predio/list'
    }
}
