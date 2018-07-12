using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

    public float jumpForce;
    public float moveForce = 365;
    public float maxSpeed = 5;

    private Rigidbody2D myRigidBody;

    public bool grounded;
    public LayerMask whatIsGround;

    private Collider2D myCollider;
    private Animator myAnimator;
    private bool jumping;

    // Use this for initialization
    void Start () {
        myRigidBody = GetComponent<Rigidbody2D>();
        myCollider = GetComponent<Collider2D>();
        myAnimator = GetComponent<Animator>();
    }
	
	// Update is called once per frame
	void Update () {

        grounded = Physics2D.IsTouchingLayers(myCollider, whatIsGround);
        if(myRigidBody.velocity.y != 0){
            jumping = true;
        }
        else{
            jumping = false;
        }

        if (myRigidBody.velocity.x < maxSpeed)
            myRigidBody.AddForce(Vector2.right * moveForce);

        if (Mathf.Abs(myRigidBody.velocity.x) > maxSpeed)
            myRigidBody.velocity = new Vector2(Mathf.Sign(myRigidBody.velocity.x) * maxSpeed, myRigidBody.velocity.y);

        if (Input.GetKeyDown(KeyCode.Space) || Input.GetMouseButtonDown(0)){
            if (grounded){
                myRigidBody.velocity = new Vector2(myRigidBody.velocity.x, jumpForce);
            }
        }

        myAnimator.SetFloat("Speed", myRigidBody.velocity.x);
        myAnimator.SetBool("Jumping", jumping);
       
    }

}
